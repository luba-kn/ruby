class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :commentators, through: :comments, source: :user
  
  has_many :marks
  
  
  validates :user, presence: true
  
  validates :title, presence: true
  validates :title, length: { maximum: 150, minimum: 2 }
  validates :title, uniqueness: true
  
  validates :body, presence: true
  validates :body, length: { maximum: 1000, minimum: 2 }
  
  validates :visible, inclusion: { in: [true, false] }
  
#  def moderators_post
#    Post.where(user: User.where(moderator:true))
#  end
  
end


