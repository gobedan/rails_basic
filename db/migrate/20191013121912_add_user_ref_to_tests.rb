class AddUserRefToTests < ActiveRecord::Migration[6.0]
  def up
    add_reference(:tests, :author, foreign_key: {to_table: :users})
  end

  def down
    remove_foreign_key :tests, :users, column: :author_id 
    remove_column :tests, :author_id
  end
end
