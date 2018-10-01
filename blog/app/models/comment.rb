class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :user, presence: true
  validates :post, presence: true
  
  validates :body, presence: true
  validates :body, length: { maximum: 500, minimum: 2 }
  
  validates :visible, inclusion: { in: [true, false] }
end

