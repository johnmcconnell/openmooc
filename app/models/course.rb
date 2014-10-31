class Course < ActiveRecord::Base
  has_one :landing_page, class_name: 'PageContent'
  validates_length_of :description, maximum: 400
end
