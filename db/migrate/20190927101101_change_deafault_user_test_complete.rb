class ChangeDeafaultUserTestComplete < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:user_tests, :complete, from: nil, to: false)
  end
end
