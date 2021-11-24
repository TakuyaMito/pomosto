class ApplicationMailer < ActionMailer::Base
  default from: ENV['LOGIN_NAME']
  layout 'mailer'
end
