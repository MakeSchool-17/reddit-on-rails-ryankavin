class User < ActiveRecord::Base
has_many :sub_reddits
before_save { self.email = email.downcase }
validates :username, presence: true, length: { maximum: 50 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
validates :password, presence: true, length: { minimum: 6 }
has_secure_password

def post
end

def edit
end

def delete
end

end
