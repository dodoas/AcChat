class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  layout 'email'

  def index
    @emails_Received = Email.received_messages(current_user.id).all
    @emails_Send = Email.send_messages(current_user.id).all
    @email = Email.new
    #TODO DA SE SVE PODESI DRUKCIJE
    #TODO SUTRA KADA AMINUJE ARNT
    #@group_emails = GroupEmail.group_email_recipients.where("recipient_id LIKE ?", current_user.id).all
    #TODO LOGIKA MI JE OD POCETKA GLUPA PA ZATO SAD OVO NE RADI!!!!!!!!!!!!!
    #TODO ZA PRIKAZ GRUPNIH PORUKA
  end

  def show
  end

  def new
    @email = Email.new
  end

  def edit
  end

  def create
    #TODO DA SE PREPRAVI DA I ZA SINGLE I GRUPNE I SVE BUDE NA JEDNOJ STRANICI!!!!!!
    #TODO TO OSTAJE ZA SUTRA SAD SAM PRSO VISE OD OVU GLUPOST!!!
    @email = Email.new(email_params)
    @email.sender_id = current_user.id
    respond_to do |format|
      if @email.save
        if current_user.has_role? :admin
        @last = Email.last
        user_in_last_post = @last.recipient_id
        user = User.user(user_in_last_post).last
        UserNotifier.notify(user).deliver
        end
        response = { :status => 1, :msg => "Success!"}
        format.json  { render :json => response }
      else
        response = { :status => 0, :msg => "Error!"}
        format.json  { render :json => response }
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
