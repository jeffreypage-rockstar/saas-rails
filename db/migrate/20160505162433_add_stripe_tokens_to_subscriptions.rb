class AddStripeTokensToSubscriptions < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :subscription_id
    add_column :subscriptions, :customer_token, :string
    add_column :subscriptions, :subscription_token, :string
  end
end
