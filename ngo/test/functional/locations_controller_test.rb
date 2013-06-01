require 'test_helper'

class LocationsControllerTest < ActionController::TestCase
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post :create, location: { address1: @location.address1, address2: @location.address2, address_name: @location.address_name, country: @location.country, country_code: @location.country_code, geo_admin_0: @location.geo_admin_0, geo_admin_1: @location.geo_admin_1, geo_admin_2: @location.geo_admin_2, geo_admin_3: @location.geo_admin_3, geo_admin_4: @location.geo_admin_4, geo_dlat: @location.geo_dlat, geo_dlong: @location.geo_dlong, geo_geocode_modified: @location.geo_geocode_modified, geo_geocode_reqd: @location.geo_geocode_reqd, is_main: @location.is_main, postcode: @location.postcode, state: @location.state, suburb: @location.suburb }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  test "should show location" do
    get :show, id: @location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location
    assert_response :success
  end

  test "should update location" do
    put :update, id: @location, location: { address1: @location.address1, address2: @location.address2, address_name: @location.address_name, country: @location.country, country_code: @location.country_code, geo_admin_0: @location.geo_admin_0, geo_admin_1: @location.geo_admin_1, geo_admin_2: @location.geo_admin_2, geo_admin_3: @location.geo_admin_3, geo_admin_4: @location.geo_admin_4, geo_dlat: @location.geo_dlat, geo_dlong: @location.geo_dlong, geo_geocode_modified: @location.geo_geocode_modified, geo_geocode_reqd: @location.geo_geocode_reqd, is_main: @location.is_main, postcode: @location.postcode, state: @location.state, suburb: @location.suburb }
    assert_redirected_to location_path(assigns(:location))
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete :destroy, id: @location
    end

    assert_redirected_to locations_path
  end
end
