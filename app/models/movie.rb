class Movie < ApplicationRecord
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  validates :title, presence: true,
                    length: { minimum: 3, maximum: 50 }

  validates :director, presence: true,
                       length: { minimum: 5, maximum: 300 }

  validates :release_year, presence: true
  validates :genre_ids, presence: true

  def most_watched?
    view_count == Movie.maximum(:view_count) && Movie.count > 1 && view_count != 0
  end

  def display_genres(movie)
    final_arr = []
    movie.genres.each do |genre|
      final_arr << genre.name
    end
    final_arr.join(', ')
  end

  def display_movie_director_realse_year(movie)
    "#{movie.title} by #{movie.director} (#{movie.release_year})"
  end
end
