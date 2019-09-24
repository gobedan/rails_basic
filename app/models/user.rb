class User < ApplicationRecord
  def get_tests_by_level(level)
    Test.where('level = ?', level)
  end
end
