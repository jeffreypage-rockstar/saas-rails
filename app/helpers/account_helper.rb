module AccountHelper
  def account_active_class(link_path)
    current_page?(link_path) ? 'btn btn-default active' : 'btn btn-default'
  end
end
