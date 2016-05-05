class AddUserIdToStripeDetails < ActiveRecord::Migration
  def change
    add_reference :stripe_details, :user, index: true
  end
end
