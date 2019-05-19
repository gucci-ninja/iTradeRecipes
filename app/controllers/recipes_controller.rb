class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end
    
    def new
        @recipe = Recipe.new
        @ingredients = Item.all
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to(root_url)
        else
            render :new
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :img_url, :ingredients)
    end


end
