class User < ApplicationRecord
  def get_tests_by_level(level)
    Test.joins('JOIN user_tests AS ut ON tests.id = ut.test_id')
        .joins('JOIN users ON ut.user_id = users.id')
        .where('level = ? AND ut.complete', level)
  end
end
