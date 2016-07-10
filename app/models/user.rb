class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :baths
  has_many :reviews
  ratyrate_rater
  

    

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
  validates :role, presence: true
  validates_inclusion_of :role,  :in => %w(male female admin), :message => "extension %s is not included in the list"
  after_validation :id, presence: true
end
