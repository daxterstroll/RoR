require 'test_helper'

class CategoryFieldsControllerTest < ActionController::TestCase
  setup do
    @category_field = category_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_field" do
    assert_difference('CategoryField.count') do
      post :create, category_field: { category_id: @category_field.category_id, filter: @category_field.filter, value: @category_field.value }
    end

    assert_redirected_to category_field_path(assigns(:category_field))
  end

  test "should show category_field" do
    get :show, id: @category_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category_field
    assert_response :success
  end

  test "should update category_field" do
    patch :update, id: @category_field, category_field: { category_id: @category_field.category_id, filter: @category_field.filter, value: @category_field.value }
    assert_redirected_to category_field_path(assigns(:category_field))
  end

  test "should destroy category_field" do
    assert_difference('CategoryField.count', -1) do
      delete :destroy, id: @category_field
    end

    assert_redirected_to category_fields_path
  end
end
