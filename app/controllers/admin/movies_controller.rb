class Admin::MoviesController < ApplicationController
  def adminindex
    @movies = Movie.all
  end

  def new
    @movie = Admin::Movie.new
  end

  def create
    @movie = Admin::Movie.new(movie_params)

    if @movie.valid?
      redirect_to "/admin/movies/"
    else
      flash[:alert] = "エラー"
      render :new
    end
  end

  private
    def movie_params
      params.require(:movie).permit(:id, :name, :year, :description, :image_url, :is_showing, :created_at, :updated_at)
    end

end
