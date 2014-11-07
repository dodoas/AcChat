class GroupEmail < ActiveRecord::Base
  resourcify
  belongs_to :sender, :class_name => User
  has_many :group_email_recipients
  accepts_nested_attributes_for :group_email_recipients, :allow_destroy => true
end
