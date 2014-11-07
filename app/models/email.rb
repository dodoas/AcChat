class Email < ActiveRecord::Base
  resourcify
  belongs_to :recipient, :class_name => User
  belongs_to :sender, :class_name => User
  scope :received_messages, -> (r) { where( :recipient_id => r ) }
  scope :send_messages, -> (s) { where( :sender_id => s ) }
  validates_presence_of :recipient_id, :message_subject, :message_body
end
