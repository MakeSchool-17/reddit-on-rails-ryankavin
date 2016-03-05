class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
  validates :content, presence: true, length: { maximum: 200 }
  
end
