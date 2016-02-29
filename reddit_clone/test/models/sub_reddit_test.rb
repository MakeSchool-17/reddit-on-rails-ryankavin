require 'test_helper'

class SubRedditTest < ActiveSupport::TestCase
  def setup
    @subReddit = SubReddit.new(title: "Sample Title", description: "Sample Description")
  end

  test "subReddit should be valid" do
    assert @subReddit.valid?
  end

  test "title should be present" do
    @subReddit.title = "   "
    assert_not @subReddit.valid?
  end

  test "description should be present" do
    @subReddit.description = "  "
    assert_not @subReddit.valid?
  end

  test "title has a limit in length" do
    @subReddit.title = "a" * 101
    assert_not @subReddit.valid?
  end

  test "description has a limit in length" do
    @subReddit.description = "a" * 201
    assert_not @subReddit.valid?
  end

  test "user can post content to a subreddit" do
    @user.posts = []
  end

  test "edit posts which are added to a subreddit" do

    @subReddit.posts = [@posts]
  end

  test "posts can be deleted" do
    @subReddit.posts = [@post]
    @subReddit.posts.delete.count
    assert_equal 0, @subReddit.posts.count
  end




end
