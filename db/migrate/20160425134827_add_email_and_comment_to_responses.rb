class AddEmailAndCommentToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :email, :string
    add_column :responses, :comment, :string
  end
end
