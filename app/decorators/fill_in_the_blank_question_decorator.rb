class FillInTheBlankQuestionDecorator < PartialDecorator
  delegate_all

  def self.type
    @type ||= 'Fill in the blank question'.freeze
  end

  def type
    self.class.type
  end
end
