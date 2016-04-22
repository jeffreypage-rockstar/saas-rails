class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :create_success, :edit]
  layout 'yesinsights'
  def index
  end

  def new
    @survey = Survey.new
    @survey.build_landing_page
    question = @survey.build_question
    3.times do
      question.choices.build
    end

  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to create_success_survey_path(@survey)
    else
      render 'create'
    end

  end

  def edit

  end

  def update

  end

  def destroy

  end

  def create_success

  end
  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(
        :name, :notify_enabled,
        question_attributes: [:name, choices_attributes: [:name] ],
        landing_page_attributes: [:headline, :subtitle, :comment_enabled]
    )
  end
end
