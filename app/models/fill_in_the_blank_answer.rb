class FillInTheBlankAnswer < ActiveRecord::Base
  belongs_to :fill_in_the_blank_question
  after_initialize :init

  def self.from_alias(alias_)
    new(text: alias_['text'])
  end

  def init
    self.text ||= ''
  end

  def correct?(_answer)
    text.strip.casecmp(answer2.strip) == 0
  end
end
