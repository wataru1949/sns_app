class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table    :posts do |t|
      t.string      :title,                        null: false
      t.string      :event,                        null: false
      t.text        :detail,                       null: false
      t.integer     :prefecture_id,                null: false
      t.integer     :accept
      # t.integer     :stance_id
      t.date        :date,                         null: false
      t.time        :start_time
      t.time        :end_time
      # t.refernces   :user,                         foreign_key: true

      t.timestamps
    end
  end
end
