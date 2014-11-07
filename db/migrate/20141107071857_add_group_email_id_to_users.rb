class AddGroupEmailIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :group_email, index: true
  end
end
