class Movie < ApplicationRecord
  has_many :movie_genres
  has_many :genres, through: :movie_genres

  validates :title, presence: true,
                    length: { minimum: 3, maximum: 50 }

  validates :director, presence: true,
                       length: { minimum: 5, maximum: 300 }

  validates :release_year, presence: true
  validates :genre_ids, presence: true

  def highest_count_of_views
    movies = Movie.all
    highest_views_number = 0
    movies.each do |movie|
      highest_views_number = movie.view_count if !movie.view_count.nil? && (movie.view_count > highest_views_number)
    end
    highest_views_number
  end

  def display_views_and_most_viewed
    if view_count == highest_count_of_views && Movie.count > 1 && view_count != 0
      "Views #{view_count} (Most Watched)"
    else
      "Views #{view_count}"
    end
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
