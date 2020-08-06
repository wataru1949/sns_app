class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.integer :prefecture_id,  null: false
      t.string :city,            null: false 
      t.string :place,           null: false

      t.timestamps
    end
  end
end
