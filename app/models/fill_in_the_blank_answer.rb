class FillInTheBlankAnswer < ActiveRecord::Base
  belongs_to :fill_in_the_blank_question, dependent: :destroy
  after_initialize :init

  def init
    self.text ||= ''
  end
end
