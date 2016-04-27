class UserMailer < ApplicationMailer
  def new_response_email(user, question)
    @user = user
    @question = question
    mail(:to => user.email, :subject => "A new response for your survey!")
  end
end
