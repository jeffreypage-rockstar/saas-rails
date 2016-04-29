class ResponsesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :create_success, :paused]
  def create
    @response = Response.new(response_params)
    if @response.choice.question.survey.active?
      if @response.save
        if @response.choice.question.survey.notify_enabled?
          UserMailer.new_response_email(current_user, @response.choice.question).deliver_now
        end

        redirect_to create_success_responses_path
      else
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
