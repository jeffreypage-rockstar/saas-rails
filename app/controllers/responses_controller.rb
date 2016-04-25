class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    @response.save
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
