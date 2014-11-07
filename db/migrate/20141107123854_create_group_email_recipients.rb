class CreateGroupEmailRecipients < ActiveRecord::Migration
  def change
    create_table :group_email_recipients do |t|
      t.references :recipient, index: true

      t.timestamps
    end
  end
end
