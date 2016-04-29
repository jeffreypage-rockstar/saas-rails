class SurveyDecorator < Draper::Decorator
  delegate_all

  def comments_count
    responses.with_comment.count
  end

  def responses_count
    responses.count
  end

  def responses
    Response.joins(choice: {question: :survey}).where(surveys: {id: object.id}).order(created_at: :desc)
  end

  def max_responses_count
    max_responses = 0
    object.question.choices.each do |choice|
      if max_responses < choice.responses.count
        max_responses = choice.responses.count
      end
    end
    max_responses
  end

end
