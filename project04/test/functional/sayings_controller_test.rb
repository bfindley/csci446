require 'test_helper'

class SayingsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sayings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saying" do
    assert_difference('Saying.count') do
      post :create, :saying => { }
    end

    assert_redirected_to saying_path(assigns(:saying))
  end

  test "should show saying" do
    get :show, :id => sayings(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sayings(:one).to_param
    assert_response :success
  end

  test "should update saying" do
    put :update, :id => sayings(:one).to_param, :saying => { }
    assert_redirected_to saying_path(assigns(:saying))
  end

  test "should destroy saying" do
    assert_difference('Saying.count', -1) do
      delete :destroy, :id => sayings(:one).to_param
    end

    assert_redirected_to sayings_path
  end
end
