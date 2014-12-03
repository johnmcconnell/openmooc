class FillInTheBlankAnswer < ActiveRecord::Base
  belongs_to :fill_in_the_blank_question

  def self.default(attributes = {})
    new(
      { text: '' }.merge(attributes)
    )
  end

  def self.from_alias(alias_)
    new(text: alias_['text'])
  end

  def correct?(answer)
    text.strip.casecmp(answer.strip) == 0
  end
end
