class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    if @response.save
      UserMailer.new_response_email(current_user, @response.choice.question).deliver_now
    end

    redirect_to create_success_responses_path
  end

  private
  def set_response
    @response = Response.find(params[:id])
  end
  def response_params
    params.require(:response).permit(:email, :comment, :choice_id)
  end
end
