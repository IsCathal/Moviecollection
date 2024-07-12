class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = 'Genre was successfully created'
      redirect_to root_path
    else
      flash[:notice] = 'There was an error'
      render 'new'
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
