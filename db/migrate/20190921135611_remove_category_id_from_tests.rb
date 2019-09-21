class RemoveCategoryIdFromTests < ActiveRecord::Migration[6.0]
  def change

    remove_column :tests, :category_id, :string
  end
end
