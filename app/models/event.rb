class Event < ApplicationRecord
  belongs_to :member
  belongs_to :team
end
