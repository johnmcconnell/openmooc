class QuizActivityDecorator < PartialDecorator
  delegate_all

  def type
    'Quiz'
  end

  def next_page_text
    'Skip quiz'
  end
end
