class CuisinesController < ApplicationController
  def index
    @cuisines = Cuisine.all
    render :index
  end

  def create
    @cuisine = Cuisine.create(
      title: params[:title],
      image: params[:image],

    )
    render :show
  end

  def show
    @cuisine = Cuisine.find_by(id: params[:id])
    render :show
  end

  def update
    @cuisine = Cuisine.find_by(id: params[:id])
    @cuisine.update(
      title: params[:title] || @cuisine.title,
      image: params[:image] || @cuisine.image,
    )
    render :show
  end

  def destroy
    @cuisine = Cuisine.find_by(id: params[:id])
    @cuisine.destroy
    render json: { message: "Cuisine destroyed successfully" }
  end
end
