class CreateTableGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.string :url, null: false 
      t.timestamps
    end
  add_reference :gists, :question, foreign_key: true
  add_reference :gists, :user, foreign_key: true 
  end
end
