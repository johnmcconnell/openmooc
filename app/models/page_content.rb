class PageContent < ActiveRecord::Base
  validates_length_of :content, maximum: 1000
end
