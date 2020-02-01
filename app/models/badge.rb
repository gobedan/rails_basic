class Badge < ApplicationRecord 
  belongs_to :category, optional: true
  belongs_to :test, optional: true 
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges

  validates :icon_file, presence: true
  validates :name, presence: true 
  validate :icon_file_existance 

  private

  def icon_file_existance
    unless (File.exist?(ENV['IMG_BADGES_PATH'] + '/' + icon_file))
      errors.add(:icon_file, message: 'File not found')
    end
  end 
end
