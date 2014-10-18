class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.index :id
      t.string :title
      t.string :subject
      t.string :topic
      t.string :content

      t.timestamps
    end
  end
end
