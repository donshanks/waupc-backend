require 'test_helper'

class MinistersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ministers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ministers" do
    assert_difference('Ministers.count') do
      post :create, :ministers => { }
    end

    assert_redirected_to ministers_path(assigns(:ministers))
  end

  test "should show ministers" do
    get :show, :id => ministers(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => ministers(:one).id
    assert_response :success
  end

  test "should update ministers" do
    put :update, :id => ministers(:one).id, :ministers => { }
    assert_redirected_to ministers_path(assigns(:ministers))
  end

  test "should destroy ministers" do
    assert_difference('Ministers.count', -1) do
      delete :destroy, :id => ministers(:one).id
    end

    assert_redirected_to ministers_path
  end
end
