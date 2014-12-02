class Content < ActiveRecord::Base
  has_one :page, as: :content
  belongs_to :page_content, dependent: :destroy
  has_one :lesson, through: :page
  accepts_nested_attributes_for :page_content

  def self.default
    new(
      page_content: PageContent.new,
    )
  end
end
