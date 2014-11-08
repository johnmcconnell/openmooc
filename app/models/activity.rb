class Activity < ActiveRecord::Base
  belongs_to :section
  belongs_to :page, polymorphic: true

  def page_content
    page.page_content
  end
end
