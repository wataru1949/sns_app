class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.integer :prefecture_id
      t.string :city
      t.string :place

      t.timestamps
    end

    add_index :addresses, [:prefecture_id, :city]
    add_index :addresses, :city
  end
end
