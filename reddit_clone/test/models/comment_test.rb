require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
  end

  test "comment should be valid" do
    assert @comment.valid?
  end

  test "content should be present" do
    @comment.content = "   "
    assert_not @comment.valid?
  end

  test "content has limit in length" do
    @comment.content = "a" * 201
    assert_not @comment.valid?
  end






end
