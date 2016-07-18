class AddUserRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_roles, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :role_id, null: false

      t.timestamps
    end
  end
end
