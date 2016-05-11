require 'color-generator'

class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :create_success, :edit, :update, :destroy, :pause, :resume, :delete]
  layout 'yesinsights'

  def index
    if current_user.admin?
      redirect_to rails_admin_path
    end
  end

  def new
    @survey = current_user.surveys.build
    @landing_page = @survey.build_landing_page
    @landing_page.headline = 'Thanks for taking the survey!'
    @landing_page.subtitle = 'If you have a moment, please briefly tell us why.'
    question = @survey.build_question
    generator = ColorGenerator.new saturation: 0.3, lightness: 0.75
    3.times do
      choice = question.choices.build
      choice.color = generator.create_hex
    end

  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user = current_user
    if @survey.save
      redirect_to create_success_survey_path(@survey)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @survey.update(survey_params)
    redirect_to surveys_path
  end

  def destroy
    @survey.destroy
    redirect_to surveys_path
  end

  def delete

  end

  def create_success

  end

  def pause
    @survey.active = false
    @survey.save
    flash[:notice] = 'Successfully paused the survey!'
    redirect_to edit_survey_path(@survey)
  end

  def resume
    @survey.active = true
    @survey.save
    flash[:notice] = 'Successfully resumed the survey!'
    redirect_to edit_survey_path(@survey)
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(
        :name, :notify_by_email, :notify_by_slack,
        question_attributes: [:name, choices_attributes: [:name, :color] ],
        landing_page_attributes: [:headline, :subtitle, :comment_enabled]
    )
  end
end
