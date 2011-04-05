class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email,:username , :password, :password_confirmation, :remember_me, :is_admin
  has_one :profile, :dependent => :destroy
  has_many :songs
  has_one :elimination
  validates_uniqueness_of :username
  validates_presence_of :username
  
  validates :password, :presence     => true, 
                     :confirmation => true
end
