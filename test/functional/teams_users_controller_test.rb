require 'test_helper'

class TeamsUsersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teams_user" do
    assert_difference('TeamsUser.count') do
      post :create, :teams_user => { }
    end

    assert_redirected_to teams_user_path(assigns(:teams_user))
  end

  test "should show teams_user" do
    get :show, :id => teams_users(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => teams_users(:one).to_param
    assert_response :success
  end

  test "should update teams_user" do
    put :update, :id => teams_users(:one).to_param, :teams_user => { }
    assert_redirected_to teams_user_path(assigns(:teams_user))
  end

  test "should destroy teams_user" do
    assert_difference('TeamsUser.count', -1) do
      delete :destroy, :id => teams_users(:one).to_param
    end

    assert_redirected_to teams_users_path
  end
end
