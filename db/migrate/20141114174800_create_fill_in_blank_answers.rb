class CreateFillInBlankAnswers < ActiveRecord::Migration
  def change
    create_table :fitb_answers do |t|
      t.string :text
      t.belongs_to :fitb_question, index: true

      t.timestamps
    end
  end
end
