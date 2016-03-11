require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  
  def setup
  	@comment_one = Comment.create(content: "First")
  	@comment_two = Comment.create(content: "Second")
  end

  def json_response
  	ActiveSupport::JSON.decode @response.body
  end


  test "index shows all comments" do
  	@response = get :index
  	assert_response :success
  	assert_equal 2, json_response['comments'].count
  end

  test "show shows comment when comment exists" do
  	@response = get :show, id: @comment_one.id
  	assert_response :success
  	assert_equal "First", json_response['comment']['content']
  end

  test "show throws error when comment does not exist" do
  	@response = get :show, id: 12
  	assert_response :missing
  	assert_equal "Unable to find comment with id 12", json_response['error']
  end

  test "create adds new comment" do
  	assert_difference 'Comment.count', 1 do
  		post :create, content: "Third"
  	end
  end

  test "create that is invalid does not create comment" do
  	@response = post :create, badfield: "Bad column"
  	assert_response :error
  	assert_equal "Unable to create comment", json_response['error']
  end

  test "update modifies existing comment" do
  	assert_equal "First", @comment_one.content
  	put :update, id: @comment_one.id, content: "Still first"
  	assert_equal "Still first", Comment.find(@comment_one.id).content
  end

  test "update returns error if comment does not exist" do
  	put :update, id: 12, content: "Twelfth comment does not exist"
  	assert_response :missing
  	assert_equal "Unable to find comment with id 12", json_response['error']
  end

  test "delete deletes comment" do
  	assert_difference "Comment.count", -1 do
  		delete :destroy, id: @comment_one.id
  	end
  end

  test "delete returns error if comment does not exist" do
  	@response = delete :destroy, id: 12
  	assert_response :missing
  	assert_equal "Unable to find comment with id 12", json_response['error']
  end
end