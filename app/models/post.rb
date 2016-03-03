class Post < ActiveRecord::Base
  belongs_to :sub_reddit
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
end
