class MovieTest < ActiveSupport::TestCase
  def setup
    @movie = Movie.new(title: 'Charlie and the chocolate factory', director: 'Mel Stuart')
  end

  test 'category should be vaild' do
    assert @movie.valid?
  end
end
