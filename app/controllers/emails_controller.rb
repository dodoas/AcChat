class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def index
    @emails = Email.all
    respond_with(@emails)
  end

  def show
    respond_with(@email)
  end

  def new
    @email = Email.new
    respond_with(@email)
  end

  def edit
  end

  def create
    @email = Email.new(email_params)
    flash[:notice] = 'Email was successfully created.' if @email.save
    respond_with(@email)
  end

  def update
    flash[:notice] = 'Email was successfully updated.' if @email.update(email_params)
    respond_with(@email)
  end

  def destroy
    @email.destroy
    respond_with(@email)
  end

  private
    def set_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:recipient_id, :title_of_the_message, :message_body, :sender_id)
    end
end
