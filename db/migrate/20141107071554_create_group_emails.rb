class CreateGroupEmails < ActiveRecord::Migration
  def change
    create_table :group_emails do |t|
      t.string :message_subject
      t.text :message_body

      t.timestamps
    end
  end
end
