class QuizActivitiesController < ApplicationController
  before_action :set_section, only: [ :new, :create ]
  respond_to :html

  def new
    redirect_to new_fill_in_blank_question_path
  end

  def create
    @quiz_activity = QuizActivity.new(quiz_activity_params)
    @quiz_activity.section = @section
    @quiz_activity.save
    redirect_to page_path(@quiz_activity.activity)
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
