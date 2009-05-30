require 'test_helper'

class DeputationsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:deputations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_deputation
    assert_difference('Deputation.count') do
      post :create, :deputation => { }
    end

    assert_redirected_to deputation_path(assigns(:deputation))
  end

  def test_should_show_deputation
    get :show, :id => deputations(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => deputations(:one).id
    assert_response :success
  end

  def test_should_update_deputation
    put :update, :id => deputations(:one).id, :deputation => { }
    assert_redirected_to deputation_path(assigns(:deputation))
  end

  def test_should_destroy_deputation
    assert_difference('Deputation.count', -1) do
      delete :destroy, :id => deputations(:one).id
    end

    assert_redirected_to deputations_path
  end
end
