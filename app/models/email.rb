class Email < ActiveRecord::Base
  belongs_to :recipient
  belongs_to :sender
end
