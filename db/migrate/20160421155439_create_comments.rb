class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email
      t.string :content
      t.references :responses, index: true
      t.timestamps null: false
    end
  end
end
