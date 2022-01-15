class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.integer :member_id, null: false
      t.integer :team_id, null: false
      t.text :comment

      t.timestamps
    end
  end
end
