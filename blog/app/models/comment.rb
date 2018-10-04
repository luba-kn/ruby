class Comment < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :commentable, polymorphic: true
  
  validates :user, presence: true
  validates :commentable, presence: true
  
  validates :body, presence: true
  validates :body, length: { maximum: 500, minimum: 2 }
  
  validates :visible, inclusion: { in: [true, false] }
end
