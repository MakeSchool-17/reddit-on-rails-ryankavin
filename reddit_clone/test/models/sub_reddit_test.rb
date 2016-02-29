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

  test "subreddit can query users" do
    
  end



end
