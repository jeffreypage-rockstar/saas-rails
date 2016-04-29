class ChoiceDecorator < Draper::Decorator
  delegate_all

  def percent
    survey = object.question.survey.decorate
    (survey.responses.count > 0) ? (object.responses.count / survey.responses.count.to_f * 100).round : 0
  end

  def relative_percent

    survey = object.question.survey.decorate
    max_responses = survey.max_responses_count

    (max_responses > 0) ? (object.responses.count / max_responses.to_f * 100).round : 0
  end
end
