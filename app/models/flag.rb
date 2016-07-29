class Flag < ActiveRecord::Base
  belongs_to :review
  belongs_to :user
  
  validates :review_id, presence: true
  validates :user_id, presence: true
  validates :reason, presence: true, length: { maximum: 100 }
end
