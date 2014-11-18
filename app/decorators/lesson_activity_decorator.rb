class LessonActivityDecorator < PartialDecorator
  delegate_all

  def type
    'Lesson material'
  end

  def next_page_text
    'Next page'
  end
end
