class AddResponseIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :responses, index: true
  end
end
