class Event < ApplicationRecord
  belongs_to :member
  belongs_to :team
  validates :event_name, length: { maximum: 20 }, presence: true
  validates :event_explanation, length: { maximum: 255 }
  validates :time , presence: true
  # def time
  #   errors.add(:time, "は開始日より前の日付は登録できません。") unless
  #   self.create_at < self.time
  # end
end
