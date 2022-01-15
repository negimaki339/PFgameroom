class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.integer :member_id, null: false
      t.integer :team_id, null: false
      t.string :event_name, null: false
      t.text :event_explanation

      t.timestamps
    end
  end
end
