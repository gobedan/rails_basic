class Test < ApplicationRecord
  def self.get_by_category(category)
    result = [] 
    Test.joins('JOIN categories as cat ON category_id = cat.id')
        .where(cat: {title: category})
        .to_a
        .each do |test| 
          result.push(test.title)
        end
    result     
  end
end
