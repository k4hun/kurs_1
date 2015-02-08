class PhotosController < ApplicationController
  
  layout 'admin'
  before_action :check_login
  before_action :find_gallery

  def index
    @photos = @gallery.photos.sort
  end

  def new
    @gal = Gallery.order('position ASC')
    @photo = Photo.new(:name => "Enter name", :gallery_id => @gallery.id)
    @counter = Photo.count + 1
  end

  def create
    @photos = Photo.new(photo_params)
    if @photos.save
      redirect_to( :action => 'index', :gallery_id => @gallery.id )
      flash[:notice] = "Photo added!"
    else
      new
      render('new')
    end
  end

  def show
    @photo = current_photo
  end

  def edit
    @gal = Gallery.order('position ASC')
    @photo = current_photo
    @counter = Photo.count
  end

  def update
    if current_photo.update_attributes(photo_params)
      redirect_to(:action => 'show', :id => current_photo.id, :gallery_id => @gallery.id)
      flash[:notice] = "Photo updated!"
    else 
      edit     
      render('edit')
    end
  end

  def destroy
    current_photo.destroy
    redirect_to(:action => 'index', :gallery_id => @gallery.id)
    flash[:notice] = "Photo destroyed!"
  end

  def current_photo
    Photo.find(params[:id])
  end

private
  def photo_params
    params.require(:photo).permit(:name, :position, :visible, :photo, :description, :gallery_id)
  end

  def find_gallery
    if params[:gallery_id] 
      @gallery = Gallery.find(params[:gallery_id])
    end    
  end

end
