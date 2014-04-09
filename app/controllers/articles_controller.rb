class ArticlesController < ApplicationController

  before_filter :get_page_title

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.active.page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end


  def get_page_title
    @page_title = "Blog"
  end

end
