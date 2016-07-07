class Bath < ActiveRecord::Base

belongs_to :user
has_many :reviews

validates :user_id, presence: true
geocoded_by :location

def location
    [address, city, country].compact.join(',')
end

def longlat
    [longitude, latitude]. compact.join(',')
end



before_validation :geocode


ratyrate_rateable "rating"

validates :country, presence: true
validates :province, presence: true
validates :city, presence: true
validates :address, presence: true
validates :rating, presence: true, inclusion: { in: 0..5, :message => "must be between 0-5" }
validates :latitude, inclusion: { in: 21..84 }
validates :longitude, inclusion: { in: -177..-53}, :uniqueness => {:scope => :latitude, :message => "and latitude data show this location is already taken"} 

end
