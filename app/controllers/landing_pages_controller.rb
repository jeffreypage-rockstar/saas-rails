class LandingPagesController < ApplicationController
  def show

  end

  def preview
    @landingPage = LandingPage.new
    @landingPage.headline = params[:headline]
    @landingPage.subtitle = params[:subtitle]
    @landingPage.comment_enabled = params[:commment_enabled]
    @comment = Comment.new
  end

end
