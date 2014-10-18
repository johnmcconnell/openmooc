class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :id
      t.string :title
      t.string :subject
      t.string :topic
      t.string :content

      t.timestamps
    end
    add_index :courses, :id, unique: true
  end
end
