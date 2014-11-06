class LessonActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :page_content
end
