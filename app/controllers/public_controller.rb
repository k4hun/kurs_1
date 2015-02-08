class PublicController < ApplicationController

  layout 'public'

  def index
    @pages = Page.where(:visible => true).last(3)
    @articles = Article.where(:visible => true).last(3)
    @galleries = Gallery.where(:visible => true).last(3)
  end

  def articles
  end

  def galleries
  end

  def categories
  end

  def news
  end

  def pages
  end
end
