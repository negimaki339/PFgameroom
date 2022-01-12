class Team < ApplicationRecord
 enum is_join: {自由加入制: 0, 承認制: 1 }


  belongs_to :user


end