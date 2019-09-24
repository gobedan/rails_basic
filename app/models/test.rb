class Test < ApplicationRecord
  def self.get_by_category(category)
    category_id = Category.find_by!(title: category).id
    Test.where('category_id = ?', category_id)
  end
end
