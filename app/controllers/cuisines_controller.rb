class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.all
    render :index
  end

  def create
    @cuisine = Cuisine.create(
      title: params[:title],
    )
    render :show
  end
end
