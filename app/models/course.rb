class Course < ActiveRecord::Base
  has_one :content_page, class_name: 'PageContent'
end
