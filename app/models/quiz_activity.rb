class QuizActivity < ActiveRecord::Base
  has_one :page, as: :activity
  has_one :section, through: :activity
  belongs_to :question, polymorphic: true

  def type
    'Quiz'
  end

  def next_page_text
    'Skip quiz'
  end
end
