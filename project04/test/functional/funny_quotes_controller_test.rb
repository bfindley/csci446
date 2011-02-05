require 'test_helper'

class FunnyQuotesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funny_quotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funny_quote" do
    assert_difference('FunnyQuote.count') do
      post :create, :funny_quote => { }
    end

    assert_redirected_to funny_quote_path(assigns(:funny_quote))
  end

  test "should show funny_quote" do
    get :show, :id => funny_quotes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => funny_quotes(:one).to_param
    assert_response :success
  end

  test "should update funny_quote" do
    put :update, :id => funny_quotes(:one).to_param, :funny_quote => { }
    assert_redirected_to funny_quote_path(assigns(:funny_quote))
  end

  test "should destroy funny_quote" do
    assert_difference('FunnyQuote.count', -1) do
      delete :destroy, :id => funny_quotes(:one).to_param
    end

    assert_redirected_to funny_quotes_path
  end
end
