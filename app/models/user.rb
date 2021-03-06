class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :teams, dependent: :destroy
         attachment :profile_image
         has_many :members, dependent: :destroy

         has_many :join_teams, through: :members, source: :team

         validates :name, length: {maximum: 20, minimum: 1}, uniqueness: true
         validates :profile, length: { maximum: 500 }

end
