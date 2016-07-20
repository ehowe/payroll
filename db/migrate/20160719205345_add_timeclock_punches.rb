class AddTimeclockPunches < ActiveRecord::Migration[5.0]
  def change
    create_table :timeclock_punches, id: :uuid do |t|
      t.datetime :in,  null: false, default: DateTime.now
      t.datetime :out
      t.uuid :user_id, null: false

      t.timestamps null: false
    end

    add_index :timeclock_punches, :user_id
    add_index :timeclock_punches, :created_at
  end
end
