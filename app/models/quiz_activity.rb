class QuizActivity < ActiveRecord::Base
  QUESTION_TYPES = [ 'Fill in the blank question' ]
  has_one :activity, as: :page
  has_one :section, through: :activity
  belongs_to :question, polymorphic: true

  def question_types
    QUESTION_TYPES.each_with_index
  end
end
