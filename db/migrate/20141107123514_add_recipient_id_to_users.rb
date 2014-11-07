class AddRecipientIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :recipient, index: true
  end
end
