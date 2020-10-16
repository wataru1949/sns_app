class CreateGroupUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_users do |t|
      t.references :group,     foreign_key: true
      t.references :user,      foreign_key: true
      t.string :type,          null: false
      t.string :status,        null: false
      t.boolean :rejected,     null: false, default: false
      t.timestamps
    end
    add_index :group_users, [ :group_id, :user_id ], unique: true
    add_index :group_users, [ :status ]
  end
end
