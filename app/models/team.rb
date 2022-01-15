class Team < ApplicationRecord
  enum is_join: {free: 0, reqaest: 1 }


  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :chats
  has_many :events
end