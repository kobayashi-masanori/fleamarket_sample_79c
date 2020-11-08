class RenameCategoryColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :category, :category_id
  end
end
