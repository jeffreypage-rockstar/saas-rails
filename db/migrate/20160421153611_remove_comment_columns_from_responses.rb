class RemoveCommentColumnsFromResponses < ActiveRecord::Migration
  def change
    remove_column :responses, :comment
    remove_column :responses, :email
  end
end
