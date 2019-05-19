class ItemsController < ApplicationController

  def index
    #@items = Item.all
    @stores = ["Metro", "Loblaws", "Fortinos"]
  end

  def create
  end
  
  def new
  end

  def generate_flier
    @store = Store.where(name: params[:store]).first # Store name
    store_id = @store.store_id
    @flyer_results = []
    recipes = Recipe.all
    store_ingredients = Item.where(store_id: store_id).map{|item| item.name}
    recipes.each do |recipe|
      ingredients = recipe.ingredients.split(",")
      match = ingredients != [""] ? match(ingredients, store_ingredients) : false
      match ? @flyer_results.push(recipe) : nil
    end
  end

  private

  def match(recipe_ingredients, market_ingredients)
    recipe_ingredients.each do |ing|
      if !(market_ingredients.any? { |s| s.include?(ing.upcase) })
        return false
      end
    end
    return true

  end
end
