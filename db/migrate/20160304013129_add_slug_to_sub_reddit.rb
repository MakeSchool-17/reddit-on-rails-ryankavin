class AddSlugToSubReddit < ActiveRecord::Migration
  def change
    add_column :sub_reddits, :slug, :string
  end
end
