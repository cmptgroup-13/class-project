class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, 
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable


         

  has_many :baths
  has_many :reviews

  
  geocoded_by :ip_address
  after_validation :geocode,
  :if => lambda{ |obj| obj.ip_address_changed? }
  
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#", mini: "75X75#" },
  default_url: lambda { |image| ActionController::Base.helpers.asset_path('poop.png') }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      # user.image = auth.info.image
      user.email = auth.info.email
    end
  end
  
  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def password_required?
    super && provider.blank?
  end
  
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  # validates :role, presence: true
  # validates_inclusion_of :role,  :in => %w(male female admin), :message => "extension %s is not included in the list"
  after_validation :id, presence: true
end
