class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|

      t.text :body
      t.string :chat_image
      t.references :group,     foreign_key: true
      t.references :user,      foreign_key: true

      t.timestamps
    end
  end
end
