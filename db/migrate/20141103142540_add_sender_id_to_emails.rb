class AddSenderIdToEmails < ActiveRecord::Migration
  def change
    add_reference :emails, :sender, index: true
  end
end
