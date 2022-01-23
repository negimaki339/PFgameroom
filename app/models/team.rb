class Team < ApplicationRecord
  enum is_join: {free: 0, approval: 1 }


  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :events, dependent: :destroy

  # 承認済みメンバー
  def member_list()
    members.where(is_approval: 0)
  end
  def member_by?(user)
    members.where(user_id: user.id, is_approval: 0).exists?
  end

  # 承認待ちメンバー
  def wait_member_by?(user)
    members.where(user_id: user.id, is_approval: 2).exists?
  end
  def wait_member_list()
    members.where(is_approval: 2)
  end

  def user_belonging?(user)
      users.include?(user)
  end


end