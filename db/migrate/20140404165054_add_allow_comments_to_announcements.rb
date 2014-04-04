class AddAllowCommentsToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :allow_comments, :boolean
  end
end
