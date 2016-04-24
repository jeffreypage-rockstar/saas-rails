module SurveysHelper

  def edit_survey?
    controller?('surveys') && action?('edit')
  end

  def survey_active_class(link_path)
    current_page?(link_path) ? 'btn btn-default active' : 'btn btn-default'
  end

end
