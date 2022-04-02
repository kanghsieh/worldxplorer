class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  has_one_attached :photo
  has_many :users_locations, dependent: :destroy
  has_many :locations, through: :users_locations
  #### destroy location when user is destroyed? ####
end
