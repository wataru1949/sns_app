class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table    :posts do |t|
      t.string      :title,                        null: false
      t.text        :detail,                       null: false
      t.integer     :prefecture_id,                null: false
      t.integer     :accept_id
      t.date        :date,                         null: false
      t.time        :start_time
      t.time        :end_time
      t.string      :post_image
      # t.references  :user,                        foreign_key: true

      t.timestamps
    end
  end
end
