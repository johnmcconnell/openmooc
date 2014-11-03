class Course < ActiveRecord::Base
  has_one :page_content
  validates_length_of :description, maximum: 400
  accepts_nested_attributes_for :page_content
  after_initialize :set_content

  private

  def set_content
    self.page_content ||= PageContent.new(content: "")
  end
end
