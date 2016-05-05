class StripeController < ApplicationController
  def create_customer
    token = params[:stripeToken]

    # Create a Customer and save it for later use
    customer = Stripe::Customer.create(
        :source => token
    )

    stripe_detail = current_user.build_stripe_detail
    stripe_detail.customer_id = customer.id
    stripe_detail.save

  end

  def upgrade

  end

  def downgrade

  end
end
