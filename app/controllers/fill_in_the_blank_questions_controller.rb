class FillInTheBlankQuestionsController < ApplicationController
  before_action :set_section, only: [:new, :create_for_section ]
  before_action :set_quiz_activity, only: [:new, :update_for_quiz_activity ]
  before_action :set_question, only: [ :submit_answer, :edit, :update ]
  before_action :set_answer_submission, only: [ :submit_answer ]

  def new
    @question = FillInTheBlankQuestion.new(page_content: PageContent.new)
  end

  def edit
  end

  def create_for_section
    @question = FillInTheBlankQuestion.new(question_params)
    @question.assign_attributes({ quiz_activity: QuizActivity.new(section: @section) })
    @question.save
    redirect_to @question.page
  end

  def update_for_quiz_activity
    @quiz_activity.question.destroy
    @quiz_activity.update(question: FillInTheBlankQuestion.new(question_params))
    redirect_to @quiz_activity.page
  end

  def create
    @question = FillInTheBlankQuestion.new(question_params)
    @question.save
    redirect_to @question.quiz_activity.page
  end

  def update
    @question.update(question_params)
    redirect_to @question.quiz_activity.page
  end

  def submit_answer
    if @question.correct_answer?(@answer_submission)
      correct_response
    else
      incorrect_response
    end
  end

  private

  def correct_response
    flash[:success] = 'Great Job!'
    redirect_to @question.quiz_activity.page.decorate.next_link[:path]
  end

  def incorrect_response
    flash[:danger] =
      "Incorrect response '#{@answer_submission}'"
    redirect_to @question.quiz_activity.page
  end

  def set_question
    id = params[:id]
    @question = FillInTheBlankQuestion.find(id)
  end

  def set_section
    id = params.require(:fill_in_the_blank_question)[:section_id]
    @section = Section.find(id)
  end

  def set_quiz_activity
    id = params.require(:fill_in_the_blank_question)[:quiz_activity_id]
    @quiz_activity = QuizActivity.find(id)
  end

  def set_answer_submission
    @answer_submission = params[:answer]
  end

  def question_params
    params.require(:fill_in_the_blank_question)
      .permit(
        answers_attributes: [:id, :text, :_destroy],
        page_content_attributes: [:content],
      )
  end
end
