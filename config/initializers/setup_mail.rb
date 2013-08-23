ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "parsons-hense.info",
  :user_name            => ENV['EMAIL'],
  :password             => ENV['EMAIL_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}