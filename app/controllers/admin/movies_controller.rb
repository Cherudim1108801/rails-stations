class Admin::MoviesController < ApplicationController
  def adminindex
    @movies = Movie.all
  end
end
