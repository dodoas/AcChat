class AddGroupEmailIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :group_email_id, index: true
  end
end
