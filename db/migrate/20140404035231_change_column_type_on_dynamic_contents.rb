class ChangeColumnTypeOnDynamicContents < ActiveRecord::Migration
  def up
    change_column :dynamic_contents, :value, :text
  end

  def down
    change_column :dynamic_contents, :value, :string
  end
end
