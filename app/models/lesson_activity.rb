class LessonActivity < ActiveRecord::Base
  has_one :activity, as: :page
  belongs_to :page_content
  has_one :section, through: :activity
  accepts_nested_attributes_for :page_content
  after_initialize :init

  def type
    'Lesson material'
  end

  def next_page_text
    'Next page'
  end

  private

  def init
    self.page_content ||= PageContent.new
  end
end
