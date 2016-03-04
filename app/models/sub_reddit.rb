class SubReddit < ActiveRecord::Base
  has_many :users
  has_many :posts
  before_save { self.title = title.downcase }
  before_save { self.slug = generate_slug }
  VALID_SUBREDDIT_TITLE_REGEX = /^[\w\s]+$/
  validates :title, presence: true, length: { maximum: 21 }, format: { with: VALID_SUBREDDIT_TITLE_REGEX, multiline: true }, uniqueness: { case_sensitive: false }
  validates :description, presence: true, length: { maximum: 200 }

  def generate_slug
  	slug = title.tr(" \n\t", '').downcase
  	"#{slug}"
  end
end
