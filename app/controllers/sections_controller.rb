class SectionsController < ApplicationController
  before_action :set_section, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def show
    if @section.activities.empty?
      respond_with(@section)
    else
      redirect_to page_path(@section.activities.first)
    end
  end

  def edit
  end

  def destroy
    @section.delete
    redirect_to edit_sections_course_path(@section.course)
  end

  def update
    @section.update(course_params)
    respond_with(@section)
  end

  private

    def set_section
      id = params[:id]
      @section = Section.find(id)
    end

    def section_params
      params.require(:section).permit(:name)
    end
end
