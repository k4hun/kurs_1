class ArticlesController < ApplicationController
  layout 'admin'

  def index
    @articles = Article.sort
  end

  def new
    @pag = Page.order('position ASC')
    @article = Article.new(:name => "Enter name")
    @counter = Article.count + 1    
  end

  def create
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to( :action => 'index' )
      flash[:notice] = "Article created!"
    else
      new
      render('new')
    end
  end

  def show
    @article = current_article
  end

  def edit
    @article = current_article
    @counter = Article.count
    @pag = Page.order('position ASC')
  end

  def update
    if current_article.update_attributes(article_params)
      redirect_to(:action => 'show', :id => current_article.id)
      flash[:notice] = "Article updated!"
    else 
      edit     
      render('edit')
    end
  end

  def destroy
    current_article.destroy
    redirect_to(:action => 'index')
    flash[:notice] = "Article destroyed!"
  end

  def article_params
    params.require(:article).permit(:name, :position, :visible, :page_id, :photo, :content)
  end

  def current_article
    Article.find(params[:id])
  end

end
