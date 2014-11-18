class FillInTheBlankQuestionsController < ApplicationController
  before_action :set_section, only: [ :new, :create ]
  before_action :set_question, only: [ :submit_answer, :edit, :update ]
  before_action :set_answer_submission, only: [ :submit_answer ]

  def new
    @question = FillInTheBlankQuestion.new
  end

  def edit
  end

  def create
    @question = FillInTheBlankQuestion.new(question_params)
    @question.quiz_activity = QuizActivity.create(section: @section)
    @question.save
    redirect_to @question.quiz_activity.page
  end

  def update
    @question.update(question_params)
    redirect_to @question.quiz_activity.page
  end

  def submit_answer
    if @question.correct_answer?(@answer_submission)
      flash[:success] = 'Great Job!'
      redirect_to next_page_url(@question)
    else
      flash[:danger] = 'Try again!'
      flash[:answer_submission_error] = "Incorrect response '#{@answer_submission}'"
      redirect_to @question.quiz_activity.page
    end
  end

  private

  def next_page_url(question)
    lower_item = question.quiz_activity.page.lower_item
    if lower_item.nil?
      course_path(question.quiz_activity.page.course)
    else
      page_path(page)
    end
  end

  def set_question
    id = params[:id]
    @question = FillInTheBlankQuestion.find(id)
  end

  def set_section
    id = params[:id]
    @section = Section.find(id)
    fail 'need section' if @section.nil?
  end

  def set_answer_submission
    @answer_submission = params[:answer]
  end

  def question_params
    params.require(:fill_in_the_blank_question)
      .permit(
        answers_attributes: [ :text, :_destroy ],
        page_content_attributes: [ :content ]
      )
  end
end
