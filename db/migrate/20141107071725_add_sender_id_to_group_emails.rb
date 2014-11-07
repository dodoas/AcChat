class AddSenderIdToGroupEmails < ActiveRecord::Migration
  def change
    add_reference :group_emails, :sender_id, index: true
  end
end
