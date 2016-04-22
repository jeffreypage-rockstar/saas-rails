class RemoveResponsesIdFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :responses_id
  end
end
