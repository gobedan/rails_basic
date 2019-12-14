class Gist < ApplicationRecord
  belongs_to :user
  belongs_to :question
  validates :url, presence: true 
  scope :list_all, -> { all.order(created_at: :desc)}
end
