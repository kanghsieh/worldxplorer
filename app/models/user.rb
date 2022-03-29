class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates %i[first_name last_name], presence: true
  validates :email, uniqueness: true

  has_many :users_locations, dependent: :destroy
  has_many :locations, through: :users_locations
  #### destroy location when user is destroyed? ####
end
