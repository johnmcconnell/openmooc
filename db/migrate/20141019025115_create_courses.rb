class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses, primary_key: :id do |t|
      t.integer :id
      t.string :title
      t.string :subject
      t.string :topic
      t.text :content
      t.timestamps
    end
  end
end
