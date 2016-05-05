class StripeController < ApplicationController
  def create_customer
    token = params[:stripeToken]
    plan = params[:plan]

    # Create a Customer and save it for later use
    customer = Stripe::Customer.create(
        :source => token,
        :plan => plan,
        :trial_end => 7.days.from_now.to_time.to_i
    )

    stripe_detail = current_user.build_stripe_detail
    stripe_detail.customer_id = customer.id
    stripe_detail.plan_id = plan

    stripe_detail.save

    redirect_to account_billing_path
  end

  def upgrade

  end

  def downgrade

  end

  def cancel

  end
end
