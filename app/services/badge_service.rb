class BadgeService 
  def initialize(test_passage)
    @user = test_passage.user
    @test = test_passage.test
    @completed_tests_ids = @user.test_passages.completed.pluck(:test_id).uniq
  end

  # returns new badges that @user is capable for after completing @test (ex. test_passage#result)
  def assign_new_badges
    new_badges = [] 
    Badge.all.to_ary.map do |badge| 
      unless @user.badges.include?(badge)
        new_badges << badge if self.send(badge.rule.to_sym, badge)
      end
    end
    return new_badges
  end

  private

  def level(badge)
    tests_by_level_ids = Test.by_level(badge.level).ids
    (tests_by_level_ids - @completed_tests_ids).empty?
  end

  def category_id(badge)
    tests_by_category_ids = Test.from_category(badge.category.title).ids
    (tests_by_category_ids - @completed_tests_ids).empty?
  end

  def test_id(badge) 
    @completed_tests_ids.one? { |id| id == badge.test.id }
  end
end
