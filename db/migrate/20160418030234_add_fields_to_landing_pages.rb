class AddFieldsToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, headline, :string
    add_column :landing_pages, subtitle, :string
  end
end
