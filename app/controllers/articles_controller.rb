class ArticlesController < ApplicationController
  # GET /articles or /articles.json
  def index
    if params[:title].present?
      @articles = Article.where('LOWER(title) LIKE ?', "%#{params[:title].downcase}%").limit(10)
      save_search(params[:title])
    else
      @articles = Article.all.limit(10)
    end

    @searches = Search.group(:query).where(session_id: session.id.to_s).order('count_query DESC').limit(10).count(:query)

    if turbo_frame_request?
      render partial: 'articles', locals: { articles: @articles, searches: @searches }
    else
      render :index
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles
  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def save_search(query)
    Search.create(query: query, session_id: session.id, ip: request.remote_ip)
  end

  def article_params
    {
       title: params[:article][:title],
       body: params[:article][:body]
    }
  end
end
