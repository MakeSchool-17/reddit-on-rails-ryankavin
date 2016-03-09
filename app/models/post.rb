class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :sub_reddit
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
end
