class Activity < ActiveRecord::Base
  belongs_to :section
  belongs_to :page, polymorphic: true
  before_save :update_position
  has_one :course, through: :section

  def update_position
    self.position ||= section.activities.size
  end
end
