class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|

      t.string :name, null: false
      t.integer :landing_page_id
      t.integer :question_id
      t.timestamps null: false
    end

    add_index :surveys, :question_id
  end
end
