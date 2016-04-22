class AddNotifyEnabledToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :notify_enabled, :boolean, default: true
  end
end
