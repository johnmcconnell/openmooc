class Course < ActiveRecord::Base
  has_one :page_content
  validates_length_of :description, maximum: 400
end
