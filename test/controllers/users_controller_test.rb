require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = User.new(username: "Ryan", email: "example@makeschool.com", password: "foobar", password_confirmation: "foobar")
    @user.save
  end

  test "index returns all users" do
    get :index
    assert_response :success
  end

  test "show returns one user for certain ID" do
    get :show, id: @user.id
    assert_response :success
  end

  test "should get create" do
    assert_difference 'User.count', 1 do
      post :create, user: { username: "Kavin", email: "dnsaudada@naver.com", password: "14141414" }
    end
  end

  test "update should update user info" do
    put :update, id: @user, user: { username: "Kavin", email: "dnsaudada@naver.com", password: "14141414" }
    assert_response :success
  end

  test "destroy should delete a user" do
    assert_difference 'User.count', -1 do
      delete :destroy, id: @user
    end
  end

end
