class StripeController < ApplicationController
  def create_customer
    token = params[:stripeToken]

    # Create a Customer
    customer = Stripe::Customer.create(
        :source => token
    )
    stripe_details = current_user.build_stripe_details
    stripe_details.customer_id = customer.id
    stripe_details.save

  end
end
