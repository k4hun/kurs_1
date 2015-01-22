class CategoriesController < ApplicationController

  def index
    @categories = Category.sort
  end

  def show
    @category = current_category
  end

  def new
    @category = Category.new(:name => "Enter name")
    @counter = Category.count + 1
  end

  def edit
    @category = current_category
    @counter = Category.count
  end

  def update
    if current_category.update_attributes(category_params)
      redirect_to(:action => 'show', :id => current_category.id)
    else
      render('edit')
    end
  end

  def destroy
    current_category.destroy
    redirect_to(:action => 'index')
    flash[:alert] = "Category destroyed!"
  end

  def create
    @categories = Category.new(category_params)
    if @categories.save
      redirect_to( :action => 'index' )
      flash[:alert] = "Category created!"
    else
      #counter = Category.count + 1
      render('new')
    end
  end

  def category_params
    params.require(:category).permit(:name, :position, :visible)
  end

  def current_category
    current_category = Category.find(params[:id])
  end
end
