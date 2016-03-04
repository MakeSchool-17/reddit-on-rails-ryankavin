require 'test_helper'

class SubRedditsControllerTest < ActionController::TestCase
  def setup
  	@sub_reddit = SubReddit.new(title: "Sample Title", description: "Sample Description")
  	@sub_reddit.save
  end

  test "index shows all subreddits" do
  	get :index

  	assert_response :success
  end

  test "show shows subreddit" do
  	get :show, id: @sub_reddit

  	assert_response :success
  end

  test "new shows create subreddit" do
  	get :new

  	assert_response :success
  end

  test "Get subreddit by slug" do
    get :show_by_slug, slug: @sub_reddit.slug
    sub_reddit = assigns(:sub_reddit)
    assert_response :success
    assert_equal @sub_reddit, sub_reddit
  end

end
