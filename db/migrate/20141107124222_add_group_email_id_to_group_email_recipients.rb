class AddGroupEmailIdToGroupEmailRecipients < ActiveRecord::Migration
  def change
    add_column :group_email_recipients, :group_email_id, :integer
  end
end
