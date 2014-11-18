module QuizHelper
  def new_question_links(section)
    {
      'Fill in the blank question' => new_fill_in_blank_question_path(section),
    }
  end
end
