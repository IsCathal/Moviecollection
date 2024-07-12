require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      genre = Genre.create(name: 'Actions')
      movie = Movie.new(title: 'Willy Wonka & the Chocolate Factory', director: 'Mel Stuart', release_year: 1971,
                        genre_ids: [genre.id])
      expect(movie).to be_valid
    end

    it 'is not valid without a title' do
      movie = Movie.new(title: '', director: 'Mel Stuart', release_year: 1971)
      expect(movie).not_to be_valid
    end
  end

  before(:each) do
    @genre1 = Genre.create(name: 'comedy')

    @movie1 = Movie.create(title: 'Willy Wonka & the Chocolate Factory', director: 'Mel Stuart', release_year: 1971,
                           genre_ids: [@genre1.id], view_count: 500)
    @movie2 = Movie.create(title: 'The Terminator', director: 'James Cameron', release_year: 1985,
                           genre_ids: [@genre1.id], view_count: 200)
  end

  describe '#display_views_and_most_viewed' do
    it 'returns the View Count with Most Watched Added' do
      expect(@movie1.display_views_and_most_viewed).to eq('Views 500 (Most Watched)')
    end

    it 'returns the View Count with Most Watched Added' do
      expect(@movie2.display_views_and_most_viewed).to eq('Views 200')
    end
  end

  describe '#display_movie_director_realse_year' do
    it 'returns the movie title and director and release year' do
      expect(@movie1.display_movie_director_realse_year(@movie1)).to eq('Willy Wonka & the Chocolate Factory by Mel Stuart (1971)')
    end
  end
end
