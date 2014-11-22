class FillInTheBlankAnswer < ActiveRecord::Base
  belongs_to :fill_in_the_blank_question, dependent: :destroy
  has_many :aliases
  after_initialize :init

  def init
    self.text ||= ''
  end
end
