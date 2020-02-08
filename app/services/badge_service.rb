class BadgeService 
  RULES = %i[test level category]

  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @completed_test_ids = @user.test_passages.completed.pluck(:test_id)
    @successful_test_passages = @user.test_passages.select { |passage| passage.successful? }
    @successful_test_ids = @successful_test_passages.map { |passage| passage.test.id }
  end

  # returns new badges that @user is capable for after completing @test (ex. test_passage#result)
  def assign_new_badges
    Badge.all.to_ary.select do |badge| 
      !@user.badges.include?(badge) && self.send(badge.rule.to_sym, badge)
    end
  end

  private

  def level(badge)
    if @test.level == badge.value && @test_passage.successful?
      tests_by_level_ids = Test.by_level(badge.value).ids
      (tests_by_level_ids - @successful_test_ids).empty?
    end
  end

  def category(badge)
    if @test.category.id == badge.value && @test_passage.successful?
      tests_by_category_ids = Test.from_category(Category.find(badge.value).title).ids
      (tests_by_category_ids - @successful_test_ids).empty?
    end
  end

  def test(badge) 
    @test.id == badge.value && 
    @test_passage.successful? &&
    @completed_test_ids.one? { |id| id == badge.value }
  end
end
