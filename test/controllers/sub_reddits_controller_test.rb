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

  test "show shows one certain subreddit" do
  	get :show, id: @sub_reddit.id
  	assert_response :success
  end

  test "create should create a subreddit" do
    assert_difference 'SubReddit.count', 1 do
      post :create, id: @sub_reddit.id, title: "New Title", description: "New Description"
    end
  end

  test "update should update sub_reddit info" do
    put :update, id: @sub_reddit, title: "New Title", description: "New Description"
    assert_response :success
  end

  test "destroy should delete a sub_reddit" do
    assert_difference 'SubReddit.count', -1 do
      delete :destroy, id: @sub_reddit
    end
  end

  test "Get subreddit by slug" do
    get :show_by_slug, slug: @sub_reddit.slug
    sub_reddit = assigns(:sub_reddit)
    assert_response :success
    assert_equal @sub_reddit, sub_reddit
  end

  test "Incorrect subreddit name should throw 404 error" do
    get :show_by_slug, slug: 'titlenotexist'
    sub_reddit = assigns(:sub_reddit)
    assert_response :missing
    assert_equal nil, sub_reddit
  end
end
