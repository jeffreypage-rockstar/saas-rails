class CreateStripeDetails < ActiveRecord::Migration
  def change
    create_table :stripe_details do |t|
      t.boolean :trial_started, default: false
      t.string :customer_id
      t.string :plan_id
      t.timestamps null: false
    end
  end
end
