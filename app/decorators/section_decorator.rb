class SectionDecorator < Draper::Decorator
  delegate_all

  def question_links
    { 'Fill in the blank question' => FillInTheBlankQuestion }
  end
end
