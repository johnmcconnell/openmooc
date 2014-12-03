class FillInTheBlankQuestionsController < ApplicationController
  before_action :set_lesson, only: [:new, :create]
  before_action :set_question, only: [:submit_answer, :edit, :update]
  before_action :set_answer_submission, only: [:submit_answer]
  helper :question
  respond_to :html

  def new
    @question = FillInTheBlankQuestion.default(lesson: @lesson)
  end

  def edit
  end

  def create
    @page = Page.create(
      lesson: @lesson,
      content: FillInTheBlankQuestion.new(
        question_params
      )
    )
    respond_with @page
  end

  def update
    @question.update(question_params)
    respond_with @question.page
  end

  def submit_answer
    if @question.correct_answer?(@answer_submission)
      correct_response
    else
      incorrect_response
    end
  end

  private

  def answers_from_aliases
    answers = aliases_params.keep_if { |a| a['add'] == '1' }
    answers.map! { |a| FillInTheBlankAnswer.from_alias(a) }
  end

  def aliases_params
    params.permit(aliases: [:add, :text]).require(:aliases)
  end

  def correct_response
    flash[:success] = 'Great Job!'
    redirect_to @question.page.decorate.next_link[:path]
  end

  def incorrect_response
    flash[:danger] =
      "Incorrect response '#{@answer_submission}'"
    redirect_to @question.page
  end

  def set_question
    id = params[:id]
    @question = FillInTheBlankQuestion.find(id)
  end

  def set_lesson
    id = params[:lesson_id] || params.require(:fill_in_the_blank_question)[:lesson_id]
    @lesson = Lesson.find(id)
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
