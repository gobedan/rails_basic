class RemoveCategoriesLevelTestsFromBadges < ActiveRecord::Migration[6.0]
  def change
    remove_column :badges, :category_id, :integer
    remove_column :badges, :test_id, :integer
    remove_column :badges, :level, :integer
  end
end
