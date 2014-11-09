class Section < ActiveRecord::Base
  has_many :activities, -> { order :position }, dependent: :destroy
  belongs_to :course
end
