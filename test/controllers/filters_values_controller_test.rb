require 'test_helper'

class FiltersValuesControllerTest < ActionController::TestCase
  setup do
    @filters_value = filters_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filters_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filters_value" do
    assert_difference('FiltersValue.count') do
      post :create, filters_value: { option: @filters_value.option }
    end

    assert_redirected_to filters_value_path(assigns(:filters_value))
  end

  test "should show filters_value" do
    get :show, id: @filters_value
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filters_value
    assert_response :success
  end

  test "should update filters_value" do
    patch :update, id: @filters_value, filters_value: { option: @filters_value.option }
    assert_redirected_to filters_value_path(assigns(:filters_value))
  end

  test "should destroy filters_value" do
    assert_difference('FiltersValue.count', -1) do
      delete :destroy, id: @filters_value
    end

    assert_redirected_to filters_values_path
  end
end
