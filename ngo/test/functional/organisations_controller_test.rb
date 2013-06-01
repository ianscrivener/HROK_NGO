require 'test_helper'

class OrganisationsControllerTest < ActionController::TestCase
  setup do
    @organisation = organisations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organisations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organisation" do
    assert_difference('Organisation.count') do
      post :create, organisation: { main_email: @organisation.main_email, main_fax: @organisation.main_fax, main_phone: @organisation.main_phone, main_url: @organisation.main_url, name_display: @organisation.name_display, name_full: @organisation.name_full, name_short: @organisation.name_short, ngo_long_description: @organisation.ngo_long_description, ngo_short_description: @organisation.ngo_short_description }
    end

    assert_redirected_to organisation_path(assigns(:organisation))
  end

  test "should show organisation" do
    get :show, id: @organisation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organisation
    assert_response :success
  end

  test "should update organisation" do
    put :update, id: @organisation, organisation: { main_email: @organisation.main_email, main_fax: @organisation.main_fax, main_phone: @organisation.main_phone, main_url: @organisation.main_url, name_display: @organisation.name_display, name_full: @organisation.name_full, name_short: @organisation.name_short, ngo_long_description: @organisation.ngo_long_description, ngo_short_description: @organisation.ngo_short_description }
    assert_redirected_to organisation_path(assigns(:organisation))
  end

  test "should destroy organisation" do
    assert_difference('Organisation.count', -1) do
      delete :destroy, id: @organisation
    end

    assert_redirected_to organisations_path
  end
end
