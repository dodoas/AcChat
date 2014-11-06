class Email < ActiveRecord::Base
  belongs_to :recipient, :class_name => User
  belongs_to :sender, :class_name => User
  scope :received_messages, -> (r) { where(:recipient_id => r) }
  scope :send_messages, -> (s) { where(:sender_id => s) }
end
