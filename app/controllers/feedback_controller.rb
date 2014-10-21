class FeedbackController < ApplicationController
  def new
  end

  def create
    feedback = Feedback.new(feedback_params)
    mailer = FeedbackMailer.new
    flash[:error] = fail_message unless (feedback.save && mailer.send(feedback))
    redirect_to :new
  end

  private

  def fail_message
    'sorry your feedback could not be submitted'
  end

  def feedback_params
    params.require(:feedback).permit(:subject, :message)
  end
end
