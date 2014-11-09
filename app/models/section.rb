class Section < ActiveRecord::Base
  has_many :activities, -> { order 'position ASC' }, dependent: :destroy
  belongs_to :course
end
