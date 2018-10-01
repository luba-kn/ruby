class User < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true
  
  validates :email, presence: true
  validates :email, format: { with: /\A[a-zA-Z]+[\.|\-]?[a-zA-Z]*@[a-zA-Z]{2,}\.[a-z]{2,3}/ }
  validates :email, uniqueness: true
  
  validates :moderator, inclusion: { in: [true, false] }
  validates :creator, inclusion: { in: [true, false] }
  validates :banned, inclusion: { in: [true, false] }
  
end

