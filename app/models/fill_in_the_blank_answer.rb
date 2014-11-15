class FillInTheBlankAnswer < ActiveRecord::Base
  self.table_name = 'fitb_answers'
  belongs_to :fill_in_blank_question
end
