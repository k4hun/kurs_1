class PublicController < ApplicationController

  layout 'public'

  def index
    @pages = Page.where(:visible => true).last(3)
    @articles = Article.where(:visible => true).last(3)
    @galleries = Gallery.where(:visible => true).last(3)
  end

  def articles
    @pages_menu = Page.where(:visible => true).last(10)
  end

  def galleries
    @gallery = Gallery.find(params[:gallery_id])
  end

  def categories
    @category = Category.find(params[:category_id])
  end

  def news
    @article = Article.find(params[:article_id])
  end

  def pages
    @page = Page.find(params[:page_id])
  end
end
