require 'test_helper'

class GroupEmailsControllerTest < ActionController::TestCase
  setup do
    @group_email = group_emails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_emails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_email" do
    assert_difference('GroupEmail.count') do
      post :create, group_email: { message_body: @group_email.message_body, message_subject: @group_email.message_subject }
    end

    assert_redirected_to group_email_path(assigns(:group_email))
  end

  test "should show group_email" do
    get :show, id: @group_email
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_email
    assert_response :success
  end

  test "should update group_email" do
    patch :update, id: @group_email, group_email: { message_body: @group_email.message_body, message_subject: @group_email.message_subject }
    assert_redirected_to group_email_path(assigns(:group_email))
  end

  test "should destroy group_email" do
    assert_difference('GroupEmail.count', -1) do
      delete :destroy, id: @group_email
    end

    assert_redirected_to group_emails_path
  end
end
