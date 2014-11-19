class FillInTheBlankAnswer < ActiveRecord::Base
  belongs_to :fill_in_the_blank_question, dependent: :destroy
  after_create :init

  def init
    self.text ||= ''
  end
end
