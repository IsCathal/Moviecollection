class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false },
                   length: { minimum: 6, maximum: 16 }
end
