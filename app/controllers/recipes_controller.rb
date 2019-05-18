class RecipesController < ApplicationController

    def new
        @recipe = Recipe.new
        @ingredients = Item.all
    end

    def create
        @recipe = Recipe.new(recipe_params)
        respond_to do |format|
            if @recipe.save
            end
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :img_url, { ingredients: [] })
    end


end
