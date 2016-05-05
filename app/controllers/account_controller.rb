class AccountController < ApplicationController
  layout 'yesinsights'
  def billing
    @subscription = current_user.subscription
    @subscription = current_user.build_subscription if @subscription.nil?
  end

  def cancel
    current_user.active = false
    # current_user.save
    flash[:notice] = 'You have cancelled your subscription. Your account will be inactive in the next billing cycle and you will not be charged.'
    redirect_to account_settings_path
  end
end
