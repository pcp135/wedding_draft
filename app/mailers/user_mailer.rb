class UserMailer < ActionMailer::Base
  default from: "wedding@parsons-hense.info"

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end
end