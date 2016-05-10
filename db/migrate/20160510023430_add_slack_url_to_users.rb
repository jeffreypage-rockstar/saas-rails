class AddSlackUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :slack_url, :string
  end
end
