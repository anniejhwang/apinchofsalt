class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index
  end

  def create
    @recipe = Recipe.create(
      title: params[:title],
      ingredients: params[:ingredients],
      prep_time: params[:prep_time],
      cook_time: params[:name],
      total_time: params[:name],
      instructions: params[:name],
    )
    render :show
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render :show
  end
end
