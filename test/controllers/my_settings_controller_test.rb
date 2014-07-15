require 'test_helper'

class MySettingsControllerTest < ActionController::TestCase
  setup do
    @my_setting = my_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:my_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create my_setting" do
    assert_difference('MySetting.count') do
      post :create, my_setting: { email_address: @my_setting.email_address, email_template: @my_setting.email_template, first_name: @my_setting.first_name, last_name: @my_setting.last_name, phone_number: @my_setting.phone_number }
    end

    assert_redirected_to my_setting_path(assigns(:my_setting))
  end

  test "should show my_setting" do
    get :show, id: @my_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @my_setting
    assert_response :success
  end

  test "should update my_setting" do
    patch :update, id: @my_setting, my_setting: { email_address: @my_setting.email_address, email_template: @my_setting.email_template, first_name: @my_setting.first_name, last_name: @my_setting.last_name, phone_number: @my_setting.phone_number }
    assert_redirected_to my_setting_path(assigns(:my_setting))
  end

  test "should destroy my_setting" do
    assert_difference('MySetting.count', -1) do
      delete :destroy, id: @my_setting
    end

    assert_redirected_to my_settings_path
  end
end
