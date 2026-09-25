class MoviesController < ApplicationController
  def index
    #@movies = Movie.all

    showing = true
    showing = params[:is_showing] == "0" ? false : true

    if params[:keyword] == "" && params[:is_showing] == ""
      @movies = Movie.all
    elsif params[:is_showing] == ""
      @movies = Movie.where("name LIKE ? OR description LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    elsif params[:keyword] == ""
      @movies = Movie.where(is_showing: showing)
    else
      @movies = Movie.where(is_showing: showing).and(Movie.where("name LIKE ? OR description LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%"))
    end

    @is_showing = params[:is_showing]
    @keyword = params[:keyword]
    render :index
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules.order(:start_time)
  end

  def reservation
    @movie = Movie.find(params[:id])
    @schedule = @movie.schedules.find(params[:schedule_id])
    @seats = Seat.all
    @date = params[:date] || Date.today.to_s
  end

end
