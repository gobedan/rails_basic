class User < ApplicationRecord
  def get_tests_by_level(level)
    Test.joins('JOIN user_tests AS ut ON tests.id = ut.test_id')
        .where('level = ? AND ut.user_id = ?', level, id)
  end
end
