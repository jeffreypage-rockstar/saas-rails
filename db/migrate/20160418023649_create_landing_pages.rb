class CreateLandingPages < ActiveRecord::Migration
  def change
    create_table :landing_pages do |t|

      t.timestamps null: false
    end
  end
end
