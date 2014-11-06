class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  layout 'email'

  def index
    @emails_Received = Email.received_messages(current_user.id).all
    @emails_Send = Email.send_messages(current_user.id).all
  end

  def show
  end

  def new
    @email = Email.new
  end

  def edit
  end

  def create
    @email = Email.new(email_params)
    @email.sender_id = current_user.id
    respond_to do |format|
      if @email.save
        #p = params[:recipient_id]
        #@user = User.email_to_send(p).all
        #user = @user
        #UserNotifier.notify(user).deliver
        format.html { redirect_to @email, notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to @email, notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:recipient_id, :message_subject, :message_body)
    end
end
