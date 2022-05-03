class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    
    if @movie.save
      redirect_to "/admin/movies"
    else
      flash.now[:alert] = "エラー"
      render :new
    end
  end

  def edit
    @movie = Movie.find(movie_params[:id])
  end

  def update
    @movie = Movie.find(movie_params[:id])
    
    if @movie.save
      redirect_to "/admin/movies"
    else
      flash.now[:alert] = "エラー"
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(movie_params[:id])
    @movie.destroy

    flash[:success] = "削除が完了しました"
    redirect_to "/admin/movies"

  end

  private
  def movie_params
    params.permit(:id, :name, :year, :description, :image_url, :is_showing, :created_at, :updated_at)
  end

end
