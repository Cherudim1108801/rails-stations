class Admin::MoviesController < ApplicationController
  def adminindex
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to admin_movies_path
    else
      flash[:alert] = "エラー"
      render :new, status: :unprocessable_entity
    end
  end

  private
    def movie_params
      params.require(:movie).permit(:id, :name, :year, :description, :image_url, :is_showing, :created_at, :updated_at)
    end

end
