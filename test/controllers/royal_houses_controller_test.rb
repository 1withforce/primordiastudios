require 'test_helper'

class RoyalHousesControllerTest < ActionController::TestCase
  setup do
    @royal_house = royal_houses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:royal_houses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create royal_house" do
    assert_difference('RoyalHouse.count') do
      post :create, royal_house: { alliance: @royal_house.alliance, description: @royal_house.description, name: @royal_house.name }
    end

    assert_redirected_to royal_house_path(assigns(:royal_house))
  end

  test "should show royal_house" do
    get :show, id: @royal_house
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @royal_house
    assert_response :success
  end

  test "should update royal_house" do
    patch :update, id: @royal_house, royal_house: { alliance: @royal_house.alliance, description: @royal_house.description, name: @royal_house.name }
    assert_redirected_to royal_house_path(assigns(:royal_house))
  end

  test "should destroy royal_house" do
    assert_difference('RoyalHouse.count', -1) do
      delete :destroy, id: @royal_house
    end

    assert_redirected_to royal_houses_path
  end
end
