class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to library")
  end

  def reservation_confirmation(user, book)
    @user = user
    @book = book
    mail(to: user.email, subject: "#{book.title} book reservation")
  end

end
