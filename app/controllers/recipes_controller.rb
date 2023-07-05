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
      cook_time: params[:cook_time],
      total_time: params[:total_time],
      instructions: params[:instructions],
      image: params[:image],
      user_id: current_user.id,
    )
    render :show
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render :show
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(
      title: params[:title] || @recipe.title,
      ingredients: params[:ingredients] || @recipe.ingredients,
      prep_time: params[:prep_time] || @recipe.prep_time,
      cook_time: params[:cook_time] || @recipe.cook_time,
      total_time: params[:total_time] || @recipe.total_time,
      instructions: params[:instructions] || @recipe.instructions,
      image: params[:image] || @recipe.image,
    )
    render :show
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json: { message: "Recipe destroyed successfully" }
  end
end
