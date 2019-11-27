class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}\z/i

end
