class Bath < ActiveRecord::Base

belongs_to :user
has_many :reviews

validates :user_id, presence: true
geocoded_by :location

def location
    [address, city, country].compact.join(',')
end
after_validation :geocode

ratyrate_rateable "rating"

end
