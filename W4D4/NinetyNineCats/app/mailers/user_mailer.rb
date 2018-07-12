class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = session_url
    mail(to: @user.username, subject: 'Welcome to 99 Cats')
  end
end
