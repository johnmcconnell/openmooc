class Feedback < ActiveRecord::Base
  attr_readonly :message, :subject
  belongs_to :user
end
