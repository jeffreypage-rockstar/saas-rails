class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :comment
      t.string :email
      t.integer :choice_id
      t.timestamps null: false
    end

    add_index :responses, :choice_id
  end
end
