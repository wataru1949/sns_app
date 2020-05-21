class CreateGroupPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :group_pictures do |t|
      t.string :group_image
      t.references :group,       foreign_key: true

      t.timestamps
    end
  end
end
