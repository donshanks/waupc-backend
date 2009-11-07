require 'test_helper'

class Admin::DocumentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_documents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create documents" do
    assert_difference('Admin::Documents.count') do
      post :create, :documents => { }
    end

    assert_redirected_to documents_path(assigns(:documents))
  end

  test "should show documents" do
    get :show, :id => admin_documents(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => admin_documents(:one).id
    assert_response :success
  end

  test "should update documents" do
    put :update, :id => admin_documents(:one).id, :documents => { }
    assert_redirected_to documents_path(assigns(:documents))
  end

  test "should destroy documents" do
    assert_difference('Admin::Documents.count', -1) do
      delete :destroy, :id => admin_documents(:one).id
    end

    assert_redirected_to admin_documents_path
  end
end
