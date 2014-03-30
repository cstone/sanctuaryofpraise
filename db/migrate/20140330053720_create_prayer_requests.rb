class CreatePrayerRequests < ActiveRecord::Migration
  def change
    create_table :prayer_requests do |t|
      t.string :title
      t.text :content
      t.boolean :approved

      t.timestamps
    end
  end
end
