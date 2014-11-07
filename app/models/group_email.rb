class GroupEmail < ActiveRecord::Base
  resourcify
  belongs_to :sender, :class_name => User
  has_many :recipients, :class_name => User
  accepts_nested_attributes_for :recipients, :allow_destroy => true
end
