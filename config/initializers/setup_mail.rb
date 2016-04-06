ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "cadproject2016@gmail.com",
  :password             => "CADpassword",
  :authentication       => "plain",
  :enable_starttls_auto => true
}