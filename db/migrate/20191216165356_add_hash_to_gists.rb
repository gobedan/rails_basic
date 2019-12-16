class AddHashToGists < ActiveRecord::Migration[6.0]
  def change
    add_column :gists, :hash, :string
  end
end
