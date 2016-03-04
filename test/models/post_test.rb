require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.new(title: "Title", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
  end

  test "post should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = "   "
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end

  test "title has limit in length" do
    @post.title = "a" * 101
    assert_not @post.valid?
  end

  test "content has limit in length" do
    @post.content = "a" * 1001
    assert_not @post.valid?
  end
end
