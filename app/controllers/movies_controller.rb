class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def adminmovie
    @movies = Movie.all
  end

end
