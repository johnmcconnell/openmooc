class Activity < ActiveRecord::Base
  belongs_to :section
  acts_as_list scope: :section
  belongs_to :page, polymorphic: true
  has_one :course, through: :section

  def page_number
    position
  end
end
