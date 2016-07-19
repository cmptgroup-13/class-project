class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :baths
  has_many :reviews

  
  geocoded_by :ip_address
  after_validation :geocode,
  :if => lambda{ |obj| obj.ip_address_changed? }
  
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#", mini: "75X75#" },
  default_url: lambda { |image| ActionController::Base.helpers.asset_path('poop_:style.png') }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  

    

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :role, presence: true
  validates_inclusion_of :role,  :in => %w(male female admin), :message => "extension %s is not included in the list"
  after_validation :id, presence: true
end
