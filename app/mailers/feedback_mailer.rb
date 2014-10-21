class FeedbackMailer < ActionMailer::Base
  default from: ENV['MAILER_ADDRESS']

  def feedback_email
    mail(to: ENV['ADMIN_EMAIL'], subject: feedback.subject)
  end
end
