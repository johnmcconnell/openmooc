class QuizActivitiesController < ApplicationController
  before_action :set_section, only: [:new, :create]
  before_action :set_quiz_activity, only: [:edit]
  respond_to :html

  def new
    redirect_to new_fill_in_the_blank_question_path
  end

  def create
    @quiz_activity = QuizActivity.new(quiz_activity_params)
    @quiz_activity.section = @section
    @quiz_activity.save
    redirect_to @quiz_activity.page
  end

  def edit
  end

  private

  def set_quiz_activity
    id = params[:id]
    @quiz_activity = QuizActivity.find(id)
  end

  def set_section
    id = params[:id]
    @section = Section.find(id)
    fail 'need section' if @section.nil?
  end

  def quiz_activity_params
    params.require(:quiz_activity)
      .permit(:questions, :answers)
  end
end
