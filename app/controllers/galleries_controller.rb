class GalleriesController < ApplicationController

  layout 'admin'
  before_action :check_login
  
  def index
    @galleries = Gallery.sort
  end

  def new
    @gallery = Gallery.new(:name => "Enter name")
    @counter = Gallery.count + 1
  end

  def create
    @galleries = Gallery.new(gallery_params)
    if @galleries.save
      redirect_to( :action => 'index' )
      flash[:notice] = "Gallery created!"
    else
      new
      render('new')
    end
  end

  def show
    @gallery = current_gallery
  end

  def edit
    @gallery = current_gallery
    @counter = Gallery.count
  end

  def update
    if current_gallery.update_attributes(gallery_params)
      redirect_to(:action => 'show', :id => current_gallery.id)
      flash[:notice] = "Gallery updated!"
    else 
      edit     
      render('edit')
    end
  end

  def destroy
    current_gallery.destroy
    redirect_to(:action => 'index')
    flash[:notice] = "Gallery destroyed!"
  end

  def gallery_params
    params.require(:gallery).permit(:name, :position, :visible, :description)
  end

  def current_gallery
    Gallery.find(params[:id])
  end

end
