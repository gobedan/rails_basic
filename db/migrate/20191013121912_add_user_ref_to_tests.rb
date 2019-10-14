class AddUserRefToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :author_id, :integer
    add_foreign_key :tests, :users, column: :author_id
    #add_reference(:tests, :author, foreign_key: {to_table: :users, column: :author_id})
  end
end
