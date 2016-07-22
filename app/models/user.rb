class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/

  devise :database_authenticatable, :registerable, 
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user

    if user.nil?
      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )

        # check if confirmable is enabled
        user.skip_confirmation! if user.respond_to?(:skip_confirmation)
        user.save!
      end
    end

    if identity.user != user
      identity.user = user
      identity.save!
    end

    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
         
  has_many :identities, dependant: :destroy
  has_many :baths
  has_many :reviews

  
  geocoded_by :ip_address
  after_validation :geocode,
  :if => lambda{ |obj| obj.ip_address_changed? }
  
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#", mini: "75X75#" },
  default_url: lambda { |image| ActionController::Base.helpers.asset_path('poop.png') }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  
  

    

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  # validates :role, presence: true
  # validates_inclusion_of :role,  :in => %w(male female admin), :message => "extension %s is not included in the list"
  after_validation :id, presence: true
end
