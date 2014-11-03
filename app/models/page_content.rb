class PageContent < ActiveRecord::Base
  validates_length_of :content, maximum: 1000

  def to_s
    content
  end
end
