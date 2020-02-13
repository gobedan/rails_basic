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
    actual_test_ids = actualize_test_ids(badge)    
    (tests_by_level_ids - actual_test_ids).empty? 
  end

  def category(badge)
    category = @test.category
    return unless category.id == badge.value && @test_passage.successful?
    tests_by_category_ids = Test.from_category(category.title).ids 
    actual_test_ids = actualize_test_ids(badge) 
    (tests_by_category_ids - actual_test_ids).empty?
  end

  def test(badge) 
    @test.id == badge.value && 
    @test_passage.successful? &&
    @completed_test_ids.one? { |id| id == badge.value }
  end

#формируем список ИД успешно пройденых тестов, включаем только пройденные после выдачи аналогичного бейджа
  def actualize_test_ids(badge)
    if UserBadge.where(user_id: @user.id, badge_id: badge.id).count > 0 
      actual_successful_test_ids = TestPassage.where('updated_at > ?', UserBadge.order('created_at DESC')
                                                                                .find_by(badge_id: badge.id)
                                                                                .created_at)
                                       .pluck(:test_id)
    else 
      actual_successful_test_ids = @successful_test_ids
    end
    actual_successful_test_ids
  end 
end
