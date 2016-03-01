class Comment < ActiveRecord::Base
  has_many :comments
  validates :content, presence: true, length: { maximum: 200 }
end
