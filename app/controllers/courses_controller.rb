class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @courses = Course.all
    respond_with(@courses)
  end

  def show
    respond_with(@course)
  end

  def query
    render :index
  end

  def new
    @course = Course.new
    respond_with(@course)
  end

  def edit
  end

  def create
    @course = Course.new(course_params)
    @course.save
    respond_with(@course)
  end

  def update
    @course.update(course_params)
    respond_with(@course)
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def new_page_content(course_params)
      PageContent.new(content: course_params[:page_content])
    end

    def course_params
      course_params = params.require(:course)
        .permit(:title, :subject, :topic, :description, :page_content)
      if !course_params[:page_content].nil?
        course_params[:page_content] = new_page_content(course_params)
      end
      course_params
    end
end
