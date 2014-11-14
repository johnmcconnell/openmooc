class FillInBlankQuestion < ActiveRecord::Base
  has_one :quiz_activity, as: :question
  belongs_to :page_content
  has_many :answers
  accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :page_content
  after_initialize :init

  def init
    answers << Answer.new if answers.empty?
  end
end
