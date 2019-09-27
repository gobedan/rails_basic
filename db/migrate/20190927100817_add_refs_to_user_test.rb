class AddRefsToUserTest < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_tests, :user, foreign_key: true
    add_reference :user_tests, :test, foreign_key: true
  end
end
