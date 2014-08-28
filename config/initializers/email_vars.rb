ActionMailer::Base.smtp_settings = {
  address: 'smtp.mandrillapp.com',
  port:     '587',
  user_name: ENV['mandrill_username'],
  password: ENV['mandrill_password'],
  authentication: :plain,
  enable_starttls_auto: true
}