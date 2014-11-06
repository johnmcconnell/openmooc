class Section < ActiveRecord::Base
  belongs_to :course
  after_initialize :init

  private

  def init
#    self.activities ||= []
  end
end
