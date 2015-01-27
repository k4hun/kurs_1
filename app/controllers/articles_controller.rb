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
      @counter = Article.count + 1
      @pag = Page.order('position ASC')
      render('new')
    end
  end



  def article_params
    params.require(:article).permit(:name, :position, :visible, :page_id, :photo)
  end

end
