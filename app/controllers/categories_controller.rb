class CategoriesController < ApplicationController

  def index
    @categories = Category.sort
  end

  def show
  end

  def new
  end

  def edit
  end

  def destroy
  end
end
