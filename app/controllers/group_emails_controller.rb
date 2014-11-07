class GroupEmailsController < ApplicationController

  before_action :set_group_email, only: [:show, :edit, :update, :destroy]


  def index

    if current_user.has_role? :admin
      @group_emails = GroupEmail.all
    else
      redirect_to_403
    end
  end

  def show
  end

  def new
    @group_email = GroupEmail.new
    @group_email.group_email_recipients.build
  end

  def edit
  end

  def create
    @group_email = GroupEmail.new(group_email_params)
    @group_email.sender_id = current_user.id
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

  def destroy
    @group_email.destroy
    respond_to do |format|
      format.html { redirect_to group_emails_url, notice: 'Group email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_group_email
    @group_email = GroupEmail.find(params[:id])
  end

  def group_email_params
    params.require(:group_email).permit(:message_subject, :message_body,
                                        group_email_recipients_attributes: [
                                            :id,
                                            :recipient_id,
                                            :group_email_id,
                                            :_destroy
                                        ]
    )
  end

  def redirect_to_403
    redirect_to({:controller => 'custom_error', :action => 'error_403'})
  end

end
