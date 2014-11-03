class Email < ActiveRecord::Base
  belongs_to :recipient, :class_name => User
  belongs_to :sender, :class_name => User
  scope :received_messages, -> (recipient_id) { where("recipient_id LIKE ?", recipient_id) }
  scope :send_messages, -> (sender_id) { where("sender_id LIKE ?", sender_id) }
end
