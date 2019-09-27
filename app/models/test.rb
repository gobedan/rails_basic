class Test < ApplicationRecord
  def self.get_by_category(category)
    Test.joins('JOIN categories as cat ON category_id = cat.id').where('cat.title = ?', category)
  end
end
