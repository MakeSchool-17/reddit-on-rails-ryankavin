class SubReddit < ActiveRecord::Base
  #attr_accessible :title
  has_many :users
  has_many :posts
  before_save { self.title = title.downcase }
  VALID_SUBREDDIT_TITLE_REGEX = /^[\w\s]+$/
  validates :title, presence: true, length: { maximum: 21 }, format: { with: VALID_SUBREDDIT_TITLE_REGEX, multiline: true }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 200 }

  def slug
  	title.tr(" \n\t", '').downcase
  end

  def to_param
  	"r/#{slug}"
  end
end
