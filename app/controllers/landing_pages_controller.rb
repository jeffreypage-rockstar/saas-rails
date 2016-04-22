class LandingPagesController < ApplicationController
  def show

  end

  def preview
    @landingPage = LandingPage.new
    @landingPage.headline = params[:headline]
    @landingPage.subtitle = params[:subtitle]
    @comment = Comment.new
  end

end
