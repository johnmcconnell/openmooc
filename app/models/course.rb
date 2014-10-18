class Course < ActiveRecord::Base
  attr_reader :id
  attr_accessor :title, :subject, :topic, :content
end
