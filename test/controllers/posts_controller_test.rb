require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  def setup
  	@post_one = Post.create(title: "post_one", content: "some content")
  	@post_two = Post.create(title: "post_two", content: "some more content")
  end

  def json_response
  	ActiveSupport::JSON.decode @response.body
  end

  test "index returns all posts" do
  	@response = get :index
  	assert_equal 2, json_response['posts'].count
  end

  test "show returns post by id" do
  	@response = get :show, id: @post_one.id
  	assert_equal "post_one", json_response['post']['title']
  endd

  test "create adds new post" do
  	assert_difference 'Post.count', 1 do
  		@response = post :create, title: "post_three", content: "more content?!?!11!"
  	end
  end

  test "invalid create returns error" do
  	@response = post :create, badfield: "bad content"
  	assert_equal "An error", json_response['error']
  	assert_response :error
  end

  test "update modifies post" do
  	assert_equal "some content", Post.find(@post_one.id).content
  	@response = put :update, id: @post_one.id, title: "post_one", content: "some content changed"
  	assert_equal "some content changed", Post.find(@post_one.id).content
  end

  test "delete deletes post" do
  	assert_difference 'Post.count', -1 do
  		delete :destroy, id: @post_one.id
  	end
  end
end
