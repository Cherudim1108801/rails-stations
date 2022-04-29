class Admin::MoviesController < ApplicationController
  def adminindex
    @movies = Movie.all
  end

  def new
    @Movie = Movie.new
  end
end
