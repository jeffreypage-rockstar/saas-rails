class UserDecorator < Draper::Decorator
  delegate_all

  def comments_count
    responses.with_comment.count
  end

  def responses_count
    responses.count
  end

  def responses
    Response.joins(choice: {question: {survey: :user}}).where(users: {id: object.id}).order(created_at: :desc)
  end

end
