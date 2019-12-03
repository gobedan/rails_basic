class Admin < User
  validates :last_name, presence: true
  validates :first_name, presence: true 
end
