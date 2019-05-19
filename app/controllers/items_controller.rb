class ItemsController < ApplicationController

  def index
    @items = Item.all 
  end

  def create
  end
  
  def new
  end

  def generate_flier
    @flyer_results = []
    recipes = Recipe.all
    store_ingredients = Item.where(store_id: params[:store_id]).map{|item| item.name}
    recipes.each do |recipe|
      ingredients = recipe.ingredients
       @flyer_results.push(match(ingredients, store_ingredients))
    end
  end

  private

  def match(recipe, market)
    return recipe.all? {|ing| market.include?(ing)}
  end
end
