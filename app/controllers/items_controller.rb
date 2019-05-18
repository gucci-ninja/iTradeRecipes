class ItemsController < ApplicationController

  def index
    @items = Item.all 
  end

  def create
  end
  
  def new
  end
  
end
