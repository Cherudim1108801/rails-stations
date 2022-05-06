class MoviesController < ApplicationController
  def list
    @movies = Movie.all
  end

  def search
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
    render :list
  end
end
