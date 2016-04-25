class ChoicesController < ApplicationController
  before_action :set_choice, only: [:select]

  def select
    @response = @choice.responses.build
    @landingPage = @choice.question.survey.landing_page
    render 'responses/new'
  end

  private
  def set_choice
    @choice = Choice.find(params[:id])
  end

end
