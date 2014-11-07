class GroupEmailRecipient < ActiveRecord::Base
  belongs_to :recipient, :class_name => User
  belongs_to :group_email
end
