class Api::EmailsController < ApplicationController

  def emails_All
    @emails = Email.received_messages(current_user.id).send_messages(current_user.id).all
  end

  def emails_Send
    @emails = Email.send_messages(current_user.id).all
  end

  def emails_Received
    @emails = Email.received_messages(current_user.id).all
  end

end

