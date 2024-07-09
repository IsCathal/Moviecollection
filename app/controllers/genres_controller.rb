class GenresController < ApplicationController
  def show; end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      flash[:notice] = 'Movie was successfully created'
      redirect_to root_path
      flash[:notice] = 'Movie was successfully created'

    else
      flash[:notice] = 'There was an error'
      render 'new'
    end
  end

  def index; end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
