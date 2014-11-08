class Activity < ActiveRecord::Base
  belongs_to :section
  belongs_to :page, polymorphic: true

  def show_partial
    page.show_partial
  end
end
