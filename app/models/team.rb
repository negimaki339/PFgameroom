class Team < ApplicationRecord
  enum is_join: {free: 0, approval: 1 }


  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :events, dependent: :destroy

  def member_by?(user)
    members.where(user_id: user.id).exists?
  end
  def user_belonging?(user)
      users.include?(user)
  end


end