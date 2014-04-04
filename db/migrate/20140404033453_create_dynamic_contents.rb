class CreateDynamicContents < ActiveRecord::Migration
  def change
    create_table :dynamic_contents do |t|
      t.string :title
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
