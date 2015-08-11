class RemoveActiveAdminCommentsActivities < ActiveRecord::Migration
  def change
    drop_table :activities
    drop_table :active_admin_comments
  end
end
