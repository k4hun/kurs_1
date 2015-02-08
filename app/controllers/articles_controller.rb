class ArticlesController < ApplicationController
  
  layout 'admin'
  before_action :check_login
  before_action :find_page

  def index
    @articles = @page.articles.sort
  end

  def new
    @pag = Page.order('position ASC')
    @article = Article.new(:page_id => @page.id, :name => "Enter name")
    @counter = Article.count + 1    
  end

  def create
    @articles = Article.new(article_params)
    if @articles.save
      redirect_to( :action => 'index', :page_id => @page.id)
      flash[:notice] = "Article created!"
    else
      new
      render('new', :page_id => @page.id)
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
      redirect_to(:action => 'show', :id => current_article.id, :page_id => @page.id)
      flash[:notice] = "Article updated!"
    else 
      edit     
      render('edit', :page_id => @page.id)
    end
  end

  def destroy
    current_article.destroy
    redirect_to(:action => 'index', :page_id => @page.id)
    flash[:notice] = "Article destroyed!"
  end

  def current_article
    Article.find(params[:id])
  end

private

  def article_params
    params.require(:article).permit(:name, :position, :visible, :page_id, :photo, :content)
  end

  def find_page
    if params[:page_id]
      @page = Page.find(params[:page_id])    
    end
  end


end
