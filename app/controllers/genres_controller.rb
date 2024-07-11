class GenresController < ApplicationController
  def show; end

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

  def index; end

  def genre_params
    params.require(:genres).permit(:name)
  end
end
