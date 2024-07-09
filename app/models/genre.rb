class Genre < ApplicationRecord
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { minimum: 6, maximum: 16 }
end
