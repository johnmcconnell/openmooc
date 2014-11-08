class LessonActivity < ActiveRecord::Base
  has_one :activity, as: :page
  belongs_to :page_content
  has_one :section, through: :activity
  accepts_nested_attributes_for :page_content
  after_initialize :init

  def show_partial
    { partial: 'lesson_activities/show', locals: { lesson_activity: self } }
  end

  private

  def init
    self.page_content ||= PageContent.new(content: "")
  end
end
