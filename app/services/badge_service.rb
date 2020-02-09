class BadgeService 
  RULES = %i[test level category]

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @completed_test_ids = @user.test_passages.completed.pluck(:test_id)
    @successful_test_ids = @user.test_passages.successful.pluck(:test_id)
  end

  # returns new badges that @user is capable for after completing @test (ex. test_passage#result)
  def assign_new_badges
    Badge.all.to_ary.select do |badge| 
      self.send(badge.rule.to_sym, badge)
    end
  end

  private

  def level(badge)
    return unless @test.level == badge.value && @test_passage.successful?
    tests_by_level_ids = Test.by_level(@test.level).ids
    (tests_by_level_ids - @successful_test_ids).empty?
  end

  def category(badge)
    category = @test.category
    return unless category.id == badge.value && @test_passage.successful?
    tests_by_category_ids = Test.from_category(Category.find(category.id).title).ids
    (tests_by_category_ids - @successful_test_ids).empty?
  end

  def test(badge) 
    @test.id == badge.value && 
    @test_passage.successful? &&
    @completed_test_ids.one? { |id| id == badge.value }
  end
end
