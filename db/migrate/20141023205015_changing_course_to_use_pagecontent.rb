class ChangingCourseToUsePagecontent < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.change :description, :text, limit: 250
      t.remove :content
      t.integer :page_content_id
    end
  end
end
