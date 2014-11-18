class Page < ActiveRecord::Base
  belongs_to :section
  acts_as_list scope: :section
  belongs_to :activity, polymorphic: true
  has_one :course, through: :section
end
