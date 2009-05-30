require 'test_helper'

class MissionariesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:missionaries)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_missionary
    assert_difference('Missionary.count') do
      post :create, :missionary => { }
    end

    assert_redirected_to missionary_path(assigns(:missionary))
  end

  def test_should_show_missionary
    get :show, :id => missionaries(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => missionaries(:one).id
    assert_response :success
  end

  def test_should_update_missionary
    put :update, :id => missionaries(:one).id, :missionary => { }
    assert_redirected_to missionary_path(assigns(:missionary))
  end

  def test_should_destroy_missionary
    assert_difference('Missionary.count', -1) do
      delete :destroy, :id => missionaries(:one).id
    end

    assert_redirected_to missionaries_path
  end
end
