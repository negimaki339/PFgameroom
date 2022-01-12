class Team < ApplicationRecord
  enum is_join: {free: 0, reqaest: 1 }


  belongs_to :user


end