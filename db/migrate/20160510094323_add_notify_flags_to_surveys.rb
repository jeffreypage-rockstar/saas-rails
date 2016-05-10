class AddNotifyFlagsToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :notify_by_email, :boolean, default: true
    add_column :surveys, :notify_by_slack, :boolean, default: false

    remove_column :surveys, :notify_enabled
  end
end
