class GroupEmailRecipient < ActiveRecord::Base
  resourcify
  belongs_to :recipient, :class_name => User
  belongs_to :group_email
  scope :to_group_email, -> (group_email_id) { where( :group_email_id => group_email_id ) }
  scope :current_recipient, -> (recipient_id) { where( :recipient_id => recipient_id ) }
end
