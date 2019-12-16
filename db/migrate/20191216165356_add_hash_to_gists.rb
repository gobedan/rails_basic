class AddHashToGists < ActiveRecord::Migration[6.0]
  def change
    add_column :gists, :hash_code, :string
  end
end
