module ApplicationHelper
  def bootstrap_class_for flash_type
    { success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info' }[flash_type.to_sym] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      puts "Bootstrap class: #{bootstrap_class_for(msg_type)}"
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
               concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
               concat message.html_safe unless message.blank?
             end)
    end
    nil
  end

  def controller?(controller)
    controller.eql?(controller_name)
  end

  def action?(action)
    action.eql?(action_name)
  end

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def active_class_with_controller(controller)
    controller?(controller) ? "active" : ""
  end

  def active_class_for_account_tab
    current_page?(edit_user_registration_path) || current_page?(account_billing_path) ? 'active' : ''
  end

end
