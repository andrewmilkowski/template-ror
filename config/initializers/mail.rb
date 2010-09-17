ActionMailer::Base.smtp_settings = {
  :address => "127.0.0.1",
  :port => 25,
  :domain => "example.com",
  :authentication => :login,
  :user_name => "fjguzman@example.com",
  :password => "password"  
}

# base64 encodings - useful for manual SMTP testing:
# username => ZmpndXptYW5AZXhhbXBsZS5jb20=

# password => cGFzc3dvcmQ=
