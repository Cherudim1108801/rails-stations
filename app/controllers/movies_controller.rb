class MoviesController < ApplicationController
  def list
    @movies = Movie.all
  end
end
