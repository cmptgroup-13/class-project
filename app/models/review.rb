class Review < ActiveRecord::Base

belongs_to :user
belongs_to :bath

validates :post, presence: true, length: { maximum: 300 }
after_validation :id, presence: true
validates :bath_id, presence: true
validates :user_id, presence: true


end
