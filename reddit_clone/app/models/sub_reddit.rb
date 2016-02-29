class SubReddit < ActiveRecord::Base
  validates :title, presence: true, length: { maximum: 100 }
  validates :description, presence: true, length: { maximum: 200 }

  def post
  end

  def edit
  end

  def delete
  end

end
