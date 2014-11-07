class Section < ActiveRecord::Base
  has_many :activities
  belongs_to :course

end
