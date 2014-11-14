class FillInBlankQuestionsController < ApplicationController
  before_action :set_section, only: [ :new, :create ]
  before_action :set_question, only: [ :submit_answer, :edit, :update ]
  before_action :set_answer_submission, only: [ :submit_answer ]

  def new
    @question = FillInBlankQuestion.new
  end

  def edit
  end

  def create
    @question = FillInBlankQuestion.new(question_params)
    @question.quiz_activity = QuizActivity.create(section: @section)
    @question.save
    redirect_to page_path(@question.quiz_activity.activity)
  end

  def update
    @question.update(question_params)
    redirect_to page_path(@question.quiz_activity.activity)
  end

  def submit_answer
    if @question.correct_answer?(@answer_submission)
      flash[:success] = 'Good Job!'
    else
      flash[:danger] = 'Incorrect!'
    end
    redirect_to page_path(@question.quiz_activity.activity)
  end

  private

  def set_question
    id = params[:id]
    @question = FillInBlankQuestion.find(id)
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
    params.require(:fill_in_blank_question)
      .permit(
        answers_attributes: [ :text, :_destroy ],
        page_content_attributes: [ :content ]
      )
  end
end
