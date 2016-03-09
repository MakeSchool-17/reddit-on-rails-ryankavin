require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = Comment.new(content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    @user = User.new(username: "Ryan", email: "example@makeschool.com", password: "foobar", password_confirmation: "foobar")
    @sub_reddit = SubReddit.new(title: "Sample Title", description: "Sample Description")
    @post = Post.new(title: "Placeholder Title", content: "Lorem ipsum...")
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

  test "comment has polymorphic owner" do
    @comment.commentable_id = @post.id
    @comment.commentable_type = :post
    child_comment = Comment.new(content: "This is a child comment")
    child_comment.commentable_id = @comment.id
    child_comment.commentable_type = :comment
    assert_equal :post, @comment.commentable_type.to_sym
    assert_equal :comment, child_comment.commentable_type.to_sym
  end

  test "associated children comments should be destroyed" do
    # debugger
     @comment.save

     @comment.comments.create!(content: "Lorem ipsum")
     assert_difference '@comment.comments.count', -1 do
       @comment.destroy
     end
  end



end
