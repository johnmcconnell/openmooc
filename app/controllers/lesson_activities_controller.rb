class LessonActivitiesController < ApplicationController
  before_action :set_section, only: [ :new, :create ]
  respond_to :html

  def new
    @lesson_activity = LessonActivity.new
    @lesson_activity.section = @section
  end

  def create
    @lesson_activity = LessonActivity.new(lesson_activity_params)
    @lesson_activity.section = @section
    @lesson_activity.save
    redirect_to section_path(@lesson_activity.section)
  end

  private

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
