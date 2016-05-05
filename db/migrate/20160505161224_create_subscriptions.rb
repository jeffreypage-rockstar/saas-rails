class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :subscription_id
      t.references :plan, index: true
      t.references :user, index: true
      t.timestamp :active_until
      t.timestamps null: false
    end
  end
end
