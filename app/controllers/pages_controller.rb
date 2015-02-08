class PagesController < ApplicationController

  layout 'admin'
  before_action :check_login
  
  def index
    @pages = Page.sort
  end

  def show
    @page = current_page
  end

  def new
    @page = Page.new(:name => "Enter name")
    @counter = Page.count + 1
    @cat = Category.order('position ASC')
  end

  def edit
    @page = current_page
    @counter = Page.count
    @cat = Category.order('position ASC')
  end

  def destroy
    current_page.destroy
    redirect_to(:action => 'index')
    flash[:notice] = "Page destroyed!"
  end

  def create
    @pages = Page.new(page_params)
    if @pages.save
      redirect_to( :action => 'index' )
      flash[:notice] = "Page created!"
    else
      new
      @counter = Page.count + 1
      @cat = Category.order('position ASC')
      render('new')
    end
  end

  def update
    if current_page.update_attributes(page_params)
      redirect_to(:action => 'show', :id => current_page.id)
      flash[:notice] = "Page updated!"
    else
      edit
      render('edit')
    end
  end

  def page_params
    params.require(:page).permit(:name, :position, :visible, :category_id)
  end

  def current_page
    Page.find(params[:id])
  end

end
