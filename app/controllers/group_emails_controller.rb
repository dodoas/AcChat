class GroupEmailsController < ApplicationController
  before_action :set_group_email, only: [:show, :edit, :update, :destroy]

  # GET /group_emails
  # GET /group_emails.json
  def index
    @group_emails = GroupEmail.all
  end

  # GET /group_emails/1
  # GET /group_emails/1.json
  def show
  end

  # GET /group_emails/new
  def new
    @group_email = GroupEmail.new
  end

  # GET /group_emails/1/edit
  def edit
  end

  # POST /group_emails
  # POST /group_emails.json
  def create
    @group_email = GroupEmail.new(group_email_params)

    respond_to do |format|
      if @group_email.save
        format.html { redirect_to @group_email, notice: 'Group email was successfully created.' }
        format.json { render :show, status: :created, location: @group_email }
      else
        format.html { render :new }
        format.json { render json: @group_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /group_emails/1
  # PATCH/PUT /group_emails/1.json
  def update
    respond_to do |format|
      if @group_email.update(group_email_params)
        format.html { redirect_to @group_email, notice: 'Group email was successfully updated.' }
        format.json { render :show, status: :ok, location: @group_email }
      else
        format.html { render :edit }
        format.json { render json: @group_email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /group_emails/1
  # DELETE /group_emails/1.json
  def destroy
    @group_email.destroy
    respond_to do |format|
      format.html { redirect_to group_emails_url, notice: 'Group email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group_email
      @group_email = GroupEmail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def group_email_params
      params.require(:group_email).permit(:message_subject, :message_body)
    end
end
