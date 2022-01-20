class Member < ApplicationRecord
  belongs_to :user
  enum is_approval: { approval: 0, unapproved: 1, approval_pending: 2 }
  belongs_to :team

    validates :user_id, presence: true
    validates :team_id, presence: true
    validates  :user_id, uniqueness: { scope: :team_id }
    validates  :team_id, uniqueness: { scope: :user_id }
end
