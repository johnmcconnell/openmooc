class FillInTheBlankAnswer < ActiveRecord::Base
  belongs_to :fill_in_the_blank_question
  after_initialize :init

  def init
    self.text ||= ''
  end
end
