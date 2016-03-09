class AddSubRedditIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :sub_reddit_id, :integer
  end
end
