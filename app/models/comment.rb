class Comment < ActiveRecord::Base
  has_many :comments
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, dependent: :destroy
  validates :content, presence: true, length: { maximum: 200 }

end
