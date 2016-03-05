class Post < ActiveRecord::Base
  belongs_to :sub_reddit
  belongs_to :user
  has_many :comments, as: :commentable
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
end
