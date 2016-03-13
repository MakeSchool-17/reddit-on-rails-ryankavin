require 'test_helper'

class UsersSubredditInteractionTest < ActionDispatch::IntegrationTest
  def setup
    post "/users", :user => {:username => "ryan", :email => "ryan@gmail.com", :password => "ryankim01", :password_confirmation => "ryankim01"}
    @user = User.find_by(email: "ryan@gmail.com")
    @sub_reddit = SubReddit.new(title: "Sample Title", description: "Sample Description")
  	@sub_reddit.save
  end

test "users can post to a subreddit" do
  
end

test "users can comment on a post" do
end

test "users can comment on a comment" do
end

end
