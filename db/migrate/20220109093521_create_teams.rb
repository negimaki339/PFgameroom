class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :user_id, null: false
      t.string :team_name, null: false
      t.string :game_name, null: false
      t.text :team_explanation
      t.text :overview
      t.integer :is_join# 加入ステータス, 0=自由加入制, 1=承認加入制
      t.timestamps
    end
  end
end
