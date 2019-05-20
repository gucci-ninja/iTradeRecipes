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
            redirect_to(recipes_url)
        else
            render :new
        end
    end

    def destroy
        Recipe.find(params[:id])
        redirect_to recipes_url
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            redirect_to recipes_url
        else
            render :edit
        end
    end

    private

    def recipe_params
        params.require(:recipe).permit(:name, :img_url, :ingredients)
    end


end
