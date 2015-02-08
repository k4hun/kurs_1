class PhotosController < ApplicationController
  
  layout 'admin'
  before_action :check_login

  def index
    @photos = Photo.sort
  end

  def new
    @gal = Gallery.order('position ASC')
    @photo = Photo.new(:name => "Enter name")
    @counter = Photo.count + 1
  end

  def create
    @photos = Photo.new(photo_params)
    if @photos.save
      redirect_to( :action => 'index' )
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
      redirect_to(:action => 'show', :id => current_photo.id)
      flash[:notice] = "Photo updated!"
    else 
      edit     
      render('edit')
    end
  end

  def destroy
    current_photo.destroy
    redirect_to(:action => 'index')
    flash[:notice] = "Photo destroyed!"
  end

  def photo_params
    params.require(:photo).permit(:name, :position, :visible, :photo, :description, :gallery_id)
  end

  def current_photo
    Photo.find(params[:id])
  end
end
