class ChangingCourseToUsePagecontent < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.change :description, :text, limit: 250
    end

    change_table :page_contents do |t|
      t.belongs_to :course
    end
  end
end
