class Review < ActiveRecord::Base

belongs_to :user
belongs_to :bath

validates :post, presence: true, length: { maximum: 300 }

end
