class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :recipient, index: true
      t.string :title_of_the_message
      t.text :message_body
      t.references :sender, index: true

      t.timestamps
    end
  end
end
