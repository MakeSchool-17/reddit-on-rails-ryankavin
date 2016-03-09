require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Ryan", email: "example@makeschool.com", password: "foobar", password_confirmation: "foobar")
    @subReddit = SubReddit.new(title: "Title", description: "Description.")
    @post = Post.new(title: "Placeholder Title", content: "Lorem ipsum...")
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

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                          foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email is always saved in lower-case" do
    mixed_case_email = "FoO@ExAmPlE.cOm"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "password should be present(meaning no blank)" do
    @user.password = @user.password_confirmation = "         "
    assert_not @user.valid?
  end

  test "Password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "User can post to a subreddit" do
    @subReddit.posts = []
    @user.post
    assert_equal 1, @subReddit.posts.count
  end

  test "User can edit a post in a subreddit" do
    @subReddit.posts = [@post]
    @user.edit
    assert_equal 1, @subReddit.posts.count
  end

  test "User can delete a post in a subreddit" do
    @subReddit.posts = [@post]
    @user.delete
    assert_equal 0, @subReddit.posts.count
  end

  test "associated posts should be destroyed" do
     @user.save
     @user.posts.create!(title: "Title", content: "Lorem ipsum")
     assert_difference 'Post.count', -1 do
       @user.destroy
     end
  end




end
