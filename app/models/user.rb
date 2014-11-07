class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable#,
         #:confirmable, :lockable, :timeoutable
  belongs_to :group_email
  has_many :emails
  scope :user, -> (u) { where( :id => u ) }
end
