class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:update]
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
    @subscription.update(subscription_params)
    subscriptionObject = Stripe::Subscription.retrieve(@subscription.subscription_token)
    subscriptionObject.plan = @subscription.plan.name
    subscription.save

    @subscription.save

    redirect_to account_billing_path
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :plan_id)
  end

  def set_subscription
    @subscription = Subscription.find(params[:id])
  end
end
