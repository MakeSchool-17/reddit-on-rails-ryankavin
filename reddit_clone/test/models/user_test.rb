require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Ryan", email: "example@makeschool.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "username has a limit in length" do
    @user.username = "a" * 51
    assert_not @user.valid?
  end

  test "email has a limit in length" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

end
