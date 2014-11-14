class CreateFillInBlankQuestions < ActiveRecord::Migration
  def change
    create_table :fill_in_blank_questions do |t|
      t.references :page_content, index: true
      t.references :fill_in_blank_answer, index: true

      t.timestamps
    end
  end
end
