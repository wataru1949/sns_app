class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table    :posts do |t|
      t.string      :title,                        null: false
      t.text        :detail,                       null: false
      t.integer     :prefecture_id,                null: false
      t.integer     :accept_id
      t.date        :event_date,                   default: ""
      t.time        :start_time,                   default: ""
      t.time        :end_time,                     default: ""
      t.string      :post_image

      t.timestamps
    end
  end
end
