require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    post "/users", :user => {:username => "ryan", :email => "ryan@gmail.com", :password => "ryankim01", :password_confirmation => "ryankim01"}
    @user = User.find_by(email: "ryan@gmail.com")
  end

  test "signup works" do
    assert_not_nil @user
    assert_equal "ryan@gmail.com", @user.email
  end


end
