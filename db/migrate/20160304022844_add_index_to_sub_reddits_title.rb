class AddIndexToSubRedditsTitle < ActiveRecord::Migration
  def change
    add_index :sub_reddits, :title, unique: true
  end
end
