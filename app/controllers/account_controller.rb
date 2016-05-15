class AccountController < ApplicationController
  layout 'yesinsights'

  def billing
    @subscription = current_user.subscription
    @subscription = current_user.build_subscription if @subscription.nil?
  end

  def integrations

  end

  def change_plan
    @doing = params[:doing]
    @plan_id = params[:plan_id]

  end

end
