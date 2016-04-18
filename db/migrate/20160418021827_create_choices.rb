class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.string :name
      t.string :token
      t.string :uuid, default: 'uuid_generate_v4()'
      t.integer :question_id
      t.timestamps null: false
    end

    add_index :choices, :question_id
  end
end
