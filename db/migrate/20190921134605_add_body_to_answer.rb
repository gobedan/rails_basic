class AddBodyToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :body, :string
  end
end
