class LandingPagesController < ApplicationController

  def preview
    @landingPage = LandingPage.new
    @landingPage.headline = params[:headline]
    @landingPage.subtitle = params[:subtitle]
    @landingPage.comment_enabled = params[:comment_enabled]
    @response = Response.new
  end

end
