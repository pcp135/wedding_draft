class UserMailer < ActionMailer::Base
  default from: "Steffi & Phil <wedding@parsons-hense.info>"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => t(:reset_password)
  end
end