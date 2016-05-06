module AccountHelper
  def account_active_class(link_path)
    current_page?(link_path) ? 'btn btn-default active' : 'btn btn-default'
  end

  def subscribe_button_text(plan)
    user = current_user
    if user.subscription.present? && user.subscription.plan.present?
      selected_plan = user.subscription.plan
      if selected_plan.id == plan.id
        'Current Plan'
      elsif selected_plan.id < plan.id
        'Upgrade'
      else
        'Downgrade'
      end
    else
      'Start Free Trial'
    end
  end

  def current_plan?(plan)
    if current_user.subscription.present? && current_user.subscription.plan.present?
      selected_plan = current_user.subscription.plan
      selected_plan.id == plan.id
    else
      false
    end
  end

  def buy_button_class(plan)
    if current_plan?(plan)
      'current'
    else
      ''
    end
  end
end
