class ChoicesController < ApplicationController
  before_action :set_choice, only: [:select]

  def select

  end

  private
  def set_choice
    @choice = Choice.find(params[:id])
  end
end
