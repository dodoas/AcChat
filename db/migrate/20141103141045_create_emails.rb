class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :recipient, index: true
      t.string :message_subject
      t.text :message_body

      t.timestamps
    end
  end
end
