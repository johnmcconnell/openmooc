class LessonActivity < ActiveRecord::Base
  has_one :page, as: :activity
  belongs_to :page_content
  has_one :section, through: :page
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
