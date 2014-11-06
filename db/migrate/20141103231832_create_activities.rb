class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :type

      t.belongs_to :section, index: true
      t.integer :position

      t.timestamps
    end
  end
end
