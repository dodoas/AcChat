class Api::EmailController < ApplicationController

  def save
    @email = Email.new(email_params)
    success_msg = "Thanks!"
    error_msg = "Sorry, there was an error."
    @email.sender_id = current_user.id
    respond_to do |format|
      if @email.save
        if current_user.has_role? :admin
          @last = Email.last
          user_in_last_post = @last.recipient_id
          user = User.user(user_in_last_post).last
          UserNotifier.notify(user).deliver
        end
        format.json { render json: success_msg }
      else
        format.json { render js: error_msg }
      end
    end
  end

  private

  def email_params
    params.require(:email).permit(:recipient_id, :message_subject, :message_body)
  end

end
