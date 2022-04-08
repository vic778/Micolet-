class UserMailer < ApplicationMailer

  def newsletter_confirmation(user)
    @user = user

    mail to: user.email, subject: "Newsletter Confirmation"
  end
end
