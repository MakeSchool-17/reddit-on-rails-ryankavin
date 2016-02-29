class SubReddit < ActiveRecord::Base
  has_many :users
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 200 }
end
