class CreateFillInBlankAnswers < ActiveRecord::Migration
  def change
    create_table :fill_in_blank_answers do |t|
      t.string :text
      t.belongs_to :fill_in_blank_question, index: true

      t.timestamps
    end
  end
end
