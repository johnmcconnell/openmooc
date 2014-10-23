class CreatePageContents < ActiveRecord::Migration
  def change
    create_table :page_contents do |t|
      t.text :content, limit: 1000

      t.timestamps
    end
  end
end
