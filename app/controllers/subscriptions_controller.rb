class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:update, :cancel]
  protect_from_forgery except: :webhook

  def new
    @subscription = current_user.build_subscription
    @plan_id = params[:plan]
    render layout: 'signup'
  end

  def create
    token = params[:stripeToken]
    @subscription = Subscription.new(subscription_params)

    # Create a Customer and subscribe to the selected plan with 7 days trial
    customer = Stripe::Customer.create(
        :source => token,
        :plan => @subscription.plan.name,
        :trial_end => 7.days.from_now.to_time.to_i
    )

    # Create subscription that saves customer and subscription token for later use
    @subscription.customer_token = customer.id
    @subscription.subscription_token = customer.subscriptions.first.id

    @subscription.save

    redirect_to account_billing_path
  end

  def update
    @subscription.attributes = subscription_params
    customer = Stripe::Customer.retrieve(@subscription.customer_token)
    subscription_object = customer.subscriptions.retrieve(@subscription.subscription_token)
    subscription_object.plan = @subscription.plan.name
    subscription_object.save

    @subscription.save

    redirect_to account_billing_path
  end

  def cancel
    customer = Stripe::Customer.retrieve(@subscription.customer_token)
    subscription_object = customer.subscriptions.retrieve(@subscription.subscription_token)
    subscription_object.delete(:at_period_end => true)
    flash[:alert] = 'You have cancelled your subscription. Your account will be inactive in the next billing cycle and you will not be charged.'
    redirect_to account_settings_path
  end

  def webhook
    event = Stripe::Event.retrieve(params["id"])

    case event.type
      when 'customer.subscription.deleted' #subscription is actually canceled at the end of the billing period
        current_user.subscription.subscription_token = nil
        current_user.active = false
        current_user.save
    end
    render status: :ok, json: "success"
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :plan_id)
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end
end
