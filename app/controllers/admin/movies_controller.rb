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
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    
    if @movie.update(movie_params)
      redirect_to "/admin/movies"
    else
      flash.now[:alert] = "エラー"
      render :edit
    end
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules.order(:start_time)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy

    flash[:success] = "削除が完了しました"
    redirect_to "/admin/movies"

  end

  private
  def movie_params
    params.require(:movie).permit(:id, :name, :year, :description, :image_url, :is_showing, :created_at, :updated_at)
  end

end
