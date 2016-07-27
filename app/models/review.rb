class Review < ActiveRecord::Base

belongs_to :user
belongs_to :bath
has_many :flags

validates :post, presence: true, length: { maximum: 300 }
validates :rating, presence: true, inclusion: { in: 0..5, :message => "must be between 0-5" }
after_validation :id, presence: true
validates :bath_id, presence: true
validates :user_id, presence: true


end
