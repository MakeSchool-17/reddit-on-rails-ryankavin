class RemoveAssociationsFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :sub_reddit_id
  end
end
