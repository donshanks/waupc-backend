require 'test_helper'

class ChurchesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:churches)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_church
    assert_difference('Church.count') do
      post :create, :church => { }
    end

    assert_redirected_to church_path(assigns(:church))
  end

  def test_should_show_church
    get :show, :id => churches(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => churches(:one).id
    assert_response :success
  end

  def test_should_update_church
    put :update, :id => churches(:one).id, :church => { }
    assert_redirected_to church_path(assigns(:church))
  end

  def test_should_destroy_church
    assert_difference('Church.count', -1) do
      delete :destroy, :id => churches(:one).id
    end

    assert_redirected_to churches_path
  end
end
