class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false 
      t.string :icon_file
      t.integer :level
      t.references :category, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
