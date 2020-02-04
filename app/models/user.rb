class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :feedbacks
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable

  def get_tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin? 
    self.is_a?(Admin)
  end

  def has_name?
    self.first_name.present? 
  end

  def check_for_achievements
    has_new_achievements = false
    Badge.all.to_ary.map do |badge| 
      completed_tests_ids = test_passages.completed.pluck(:test_id).uniq || []
      tests_by_level_ids = Test.by_level(badge.level).ids
      tests_by_category_ids = Test.from_category(badge.category&.title).ids
      if ((badge.level.present? && (tests_by_level_ids - completed_tests_ids).empty?) ||
          (badge.category.present? && (tests_by_category_ids - completed_tests_ids).empty?) ||
          (badge.test.present? && completed_tests_ids.one? { |id| id == badge.test.id })) &&
          !(badges.include?(badge))
        byebug
        has_new_achievements = true 
        UserBadge.create(user: self, badge: badge)
      end
    end
    return has_new_achievements
  end
end
