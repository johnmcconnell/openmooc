class FeedbackController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    feedback = Feedback.new(feedback_params)
    if feedback.save
      FeedbackMailer.feedback_email(feedback, current_user).deliver
    else
      flash[:error] = fail_message
    end
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
