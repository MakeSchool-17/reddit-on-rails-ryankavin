require 'test_helper'

class SubRedditTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Ryan", email: "example@makeschool.com", password: "foobar", password_confirmation: "foobar")
    @sub_reddit = SubReddit.new(title: "Sample Title", description: "Sample Description")
    @post = Post.new(title: "Placeholder Title", content: "Lorem ipsum...")
  end

  test "subReddit should be valid" do
    assert @sub_reddit.valid?
  end

  test "title should be present" do
    @sub_reddit.title = "   "
    assert_not @sub_reddit.valid?
  end

  test "description should be present" do
    @sub_reddit.description = "  "
    assert_not @sub_reddit.valid?
  end

  test "title has a limit in length" do
    @sub_reddit.title = "a" * 22
    assert_not @sub_reddit.valid?
  end

  test "title cannot contain any special character" do
    invalid_titles = ["&&wrongexample3**"]
    invalid_titles.each do |invalid_title|
      @sub_reddit.title = invalid_title
      assert_not @sub_reddit.valid?, "#{invalid_title.inspect} should be invalid"
    end
  end

  test "Subreddit title should be unique" do
    duplicate_subReddit = @sub_reddit.dup
    duplicate_subReddit.title = @sub_reddit.title.upcase
    @sub_reddit.save
    assert_not duplicate_subReddit.valid?
  end

  test "description has a limit in length" do
    @sub_reddit.description = "a" * 201
    assert_not @sub_reddit.valid?
  end

  test "User can post to a subreddit" do
    @post.sub_reddit = @sub_reddit
    @post.save
    assert_equal 1, @sub_reddit.reload.posts.count
  end

  test "User can edit a post in a subreddit" do
    @post.sub_reddit = @sub_reddit
    @post.save

    old_post = Post.find(@post.id)

    @post.title = "New Title"
    @post.save

    assert_not_equal @post.title, old_post.title, "Post titles should not be equal"
  end

  test "User can delete a post in a subreddit" do
    @post.sub_reddit = @sub_reddit
    @post.save

    assert_difference '@sub_reddit.reload.posts.count', -1 do
      @post.delete
    end
  end

  test "Subreddit path generated correctly" do
    slug = @sub_reddit.generate_slug

    assert_equal "sampletitle", slug
  end

  test "Subreddit slug field filled after create" do
    sub_reddit_params = {title: "Test Title", description: "Test Description"}
    sub_reddit = SubReddit.create(sub_reddit_params)

    assert_not nil, sub_reddit.slug
  end

  test "Subreddit slug field updated after update" do
    sub_reddit_params = {title: "Test Title", description: "Test Description"}
    sub_reddit = SubReddit.create(sub_reddit_params)

    old_slug = sub_reddit.slug
    sub_reddit.update(title: "New Title")

    assert_not_equal sub_reddit.slug, old_slug
  end
  # test "User can access subreddit by subreddit title" do
  #   # this kind of test is useful for controllers but not for models
  #   response = get sub_reddit_path(@sub_reddit)

  #   assert_equal 200, response.status_code, "Response status should be correct"
  # end

end
