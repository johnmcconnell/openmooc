class MultipleChoiceQuestion < ActiveRecord::Base
  belongs_to :page_content
  has_many :answers, class_name: 'MultipleChoiceAnswer'
  has_one :page, through: :quiz_activity
  has_one :section, through: :quiz_activity
  accepts_nested_attributes_for :answers, allow_destroy: true
  accepts_nested_attributes_for :page_content
  after_initialize :init

  def init
    self.page_content = PageContent.new
  end
end
