class Chat < ApplicationRecord
    belongs_to :member
    belongs_to :team
    validates :comment, length: { maximum: 255 }, presence: true
end