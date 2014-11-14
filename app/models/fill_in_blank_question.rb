class FillInBlankQuestion < ActiveRecord::Base
  has_one :quiz_activity, as: :question
  belongs_to :page_content
  has_many :answers, class_name: 'FillInBlankAnswer'
  has_one :activity, through: :quiz_activity
  has_one :section, through: :activity
  accepts_nested_attributes_for :answers
  accepts_nested_attributes_for :page_content
  after_initialize :init

  def init
    answers << FillInBlankAnswer.new if answers.empty?
    self.page_content ||= PageContent.new
  end

  def correct_answer?(answer_text)
    answers.map(&:text).detect do |valid_answer_text|
      answer_texts_match?(valid_answer_text, answer_text)
    end != nil
  end

  def to_s
    page_content.to_s
  end

  private

  def answer_texts_match?(answer1, answer2)
    answer1.strip.casecmp(answer2.strip) == 0
  end
end
