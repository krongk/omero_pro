require 'test_helper'

class JiamengsControllerTest < ActionController::TestCase
  setup do
    @jiameng = jiamengs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jiamengs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jiameng" do
    assert_difference('Jiameng.count') do
      post :create, jiameng: @jiameng.attributes
    end

    assert_redirected_to jiameng_path(assigns(:jiameng))
  end

  test "should show jiameng" do
    get :show, id: @jiameng.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jiameng.to_param
    assert_response :success
  end

  test "should update jiameng" do
    put :update, id: @jiameng.to_param, jiameng: @jiameng.attributes
    assert_redirected_to jiameng_path(assigns(:jiameng))
  end

  test "should destroy jiameng" do
    assert_difference('Jiameng.count', -1) do
      delete :destroy, id: @jiameng.to_param
    end

    assert_redirected_to jiamengs_path
  end
end
