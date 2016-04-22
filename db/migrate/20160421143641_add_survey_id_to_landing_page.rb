class AddSurveyIdToLandingPage < ActiveRecord::Migration
  def change
    add_reference :landing_pages, :survey, index: true
  end
end
