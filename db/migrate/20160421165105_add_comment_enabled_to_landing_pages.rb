class AddCommentEnabledToLandingPages < ActiveRecord::Migration
  def change
    add_column :landing_pages, :comment_enabled, :boolean, default: true
  end
end
