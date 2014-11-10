class LessonActivitiesController < ApplicationController
  before_action :set_section, only: [ :new, :create ]
  before_action :set_lesson_activity, only: [ :edit, :update ]
  respond_to :html

  def new
    @lesson_activity = LessonActivity.new
    @lesson_activity.section = @section
  end

  def edit
  end

  def create
    @lesson_activity = LessonActivity.new(lesson_activity_params)
    @lesson_activity.section = @section
    @lesson_activity.save
    redirect_to section_path(@lesson_activity.section)
  end

  def update
    @lesson_activity.update(lesson_activity_params)
    redirect_to page_path(@lesson_activity.activity)
  end

  private

    def set_lesson_activity
      id = params[:id]
      @lesson_activity = LessonActivity.find(id)
    end

    def set_section
      id = params[:id]
      @section = Section.find(id)
      fail 'need section' if @section.nil?
    end

    def lesson_activity_params
      params.require(:lesson_activity)
        .permit(page_content_attributes: [ :content ])
    end
end