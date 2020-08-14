class AddCategoryToGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :groups, :category, foreign_key: true
  end
end
