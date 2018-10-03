class Mark < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :user, presence: true
  validates :post, presence: true
  
  validates :mark, presence: true
  validates :mark, numericality: { only_integer: true, greater_than: 0, less_than: 11 }

end

