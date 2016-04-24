class AddActiveToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :active, :boolean, default: true
  end
end
