module AccountHelper
  def account_active_class(link_path)
    current_page?(link_path) ? 'btn btn-default active' : 'btn btn-default'
  end

  def subscribe_button_text(user, plan_name)
    if user.stripe_detail.present? && user.stripe_detail.plan_id.present?
      selected_plan = Plan.find_by_name(user.stripe_detail.plan_id)
      plan = Plan.find_by_name(plan_name)
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
end
