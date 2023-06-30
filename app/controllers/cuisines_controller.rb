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

  def show
    @cuisine = Cuisine.find_by(id: params[:id])
    render :show
  end
end
