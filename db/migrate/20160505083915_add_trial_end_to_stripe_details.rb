class AddTrialEndToStripeDetails < ActiveRecord::Migration
  def change
    add_column :stripe_details, :trial_end, :timestamp
  end
end
