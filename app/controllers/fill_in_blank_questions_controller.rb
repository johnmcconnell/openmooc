class FillInBlankQuestionsController < ApplicationController
  before_action :set_section, only: [ :new, :create ]

  def new
    @question = FillInBlankQuestion.new
  end

  private

  def set_section
    id = params[:id]
    @section = Section.find(id)
    fail 'need section' if @section.nil?
  end
end
