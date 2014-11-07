class AddSenderIdToGroupEmails < ActiveRecord::Migration
  def change
    add_reference :group_emails, :sender, index: true
  end
end
