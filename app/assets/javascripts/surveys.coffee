$ ->
  $("#preview_landing_page").click ->

    headline = $('#survey_landing_page_attributes_headline').val()
    subtitle = $('#survey_landing_page_attributes_subtitle').val()
    comment_enabled = $('#survey_landing_page_attributes_comment_enabled').is(':checked')

    $.get('/landing_pages/preview',
      headline: headline
      subtitle: subtitle,
      comment_enabled: comment_enabled).done (data) ->
    return false
  return
