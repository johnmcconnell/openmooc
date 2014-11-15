class CreateFillInBlankQuestions < ActiveRecord::Migration
  def change
    create_table :fitb_questions do |t|
      t.references :page_content, index: true
      t.references :fitb_answer, index: true

      t.timestamps
    end
  end
end
