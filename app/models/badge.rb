class Badge < ApplicationRecord 
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :icon_file, presence: true
  validates :name, :rule, :value, presence: true 
  validates :value, inclusion: { in: 0..Float::INFINITY }, 
                    numericality: { only_integer: true }
  validate :icon_file_existance 
  validate :rule_availability
  
  private

  def icon_file_existance
    unless (File.exist?(ENV['IMG_BADGES_PATH'] + '/' + icon_file))
      errors.add(:icon_file, message: 'File not found')
    end
  end 

  def rule_availability
    unless BadgeService::RULES.include?(rule.to_sym)
      errors.add(:rule, 'not available!')
    end
  end
   
end
