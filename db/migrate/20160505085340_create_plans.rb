class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.string :identifier
      t.integer :price
      t.integer :response_limit, default: 0
      t.integer :survey_limit, default: 0
      t.timestamps null: false
    end
  end
end
