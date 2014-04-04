class AddAllowCommentsToPrayerRequests < ActiveRecord::Migration
  def change
    add_column :prayer_requests, :allow_comments, :boolean
  end
end
