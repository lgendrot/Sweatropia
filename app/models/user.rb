class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :avatar_name
  validates_uniqueness_of :avatar_name
  before_create :build_default_profile


  has_one :profile
  has_one :sweat, through: :profile


  def build_default_profile
  	build_profile
  	true
  end
end
