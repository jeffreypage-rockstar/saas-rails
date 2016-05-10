class ResponsesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :create_success, :paused]
  def create
    @response = Response.new(response_params)
    if @response.choice.question.survey.active?
      if @response.save
        if @response.choice.question.survey.notify_by_email? # Send email to the owner of the survey
          UserMailer.new_response_email(@response.choice.question.survey.user, @response.choice.question).deliver_now
        end
        if @response.choice.question.survey.notify_by_slack && current_user.slack_url.present? # Send slack notification to the registered channel
          notifier = Slack::Notifier.new current_user.slack_url, username: 'YesInsights'
          icon_url = "http://yesinsights.com#{view_context.image_path('logo-small.png')}"
          text = "Someone responded to your survey: <a href='#{survey_url(@response.choice.question.survey)}'>#{@response.choice.question.survey.name}</a>"
          text = Slack::Notifier::LinkFormatter.format(text)
          attachment_text = "*Question*\n#{@response.choice.question.name}\n\n*Response*\n#{@response.choice.name}\n\n*Comment*\n#{@response.comment.nil? ? 'N/A' : @response.comment}"
          attachments = [{
            color: '#50b1e3',
            mrkdwn_in: ["text"],
            text: attachment_text
          }]
          puts icon_url
          notifier.ping text, icon_url: icon_url, attachments: attachments
        end

        redirect_to create_success_responses_path
      else
        @choice = @response.choice
        @landingPage = @choice.question.survey.landing_page
        render 'new'
      end
    else
      redirect_to paused_responses_path
    end
  end

  def destroy_bulk
    response_ids = params[:ids].split(',');
    response_ids.each do |response_id|
      response = Response.find(response_id)
      response.destroy
    end
  end

  def export
    @responses = Response.find(params[:response_ids])
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"responses\""
        headers['Content-Type'] ||= 'text/csv'
      end
    end
  end

  private
  def set_response
    @response = Response.find(params[:id])
  end
  def response_params
    params.require(:response).permit(:email, :comment, :choice_id)
  end
end
