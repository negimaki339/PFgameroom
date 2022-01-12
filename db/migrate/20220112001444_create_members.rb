class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :user_id, null: false
      t.integer :team_id, null: false
      t.integer :is_approval, null: false, default: 0
      t.timestamps
    end
  end
end
