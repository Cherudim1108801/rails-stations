class Admin::MoviesController < ApplicationController
  def adminmovie
    @movies = Movie.all
  end
end
