class ArticlesController < ApplicationController

    before_action :find_article, except: [:new, :create, :index, :from_author] #only:[:show,:edit,:update,:destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    #after_action 

    def index
        @articles = Article.all
    end

    def show
    end

    def new 
        @article = Article.new #envia un articulo nuevo al formlario de la vista
        @categories = Category.all
    end

    def create
        @article = current_user.articles.create(article_params) 
        #title: params[:article][:title], content: params[:article][:content]
        @article.save_categories
        
=begin
        @article = Article.create(title: params[:article][:title], 
                                  content: params[:article][:content],
                                  user: current_user)
        render json: @article
=end
        redirect_to @article
    end

    def edit
        puts "\n\n\n  #{@article.persisted?} \n\n\n"
        @categories = Category.all
    end

    def update
        @article.update(article_params) #title: params[:article][:title], content: params[:article][:content]
        @article.save_categories
        redirect_to @article
    end

    def destroy
        @article.destroy
        redirect_to root_path
    end

    def find_article
        @article = Article.find(params[:id])
        #puts "ESTOY EN FIND ARTICLE"
    end
   
    def from_author
        @user = User.find(params[:user_id])
    end 

    #parametros fuertes
    def article_params
        params.require(:article).permit(:title, :content, :status, category_elements: [])
        #cuando se recibe un array, se debe indicar de esta forma
    end
end
