class ArticlesController < ApplicationController

    before_action :find_article, except: [:new, :create, :index] #only:[:show,:edit,:update,:destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    #after_action 

    def index
        @articles = Article.all
    end

    def show
    end

    def new 
        @article = Article.new #envia un articulo nuevo al formlario de la vista
    end

    def create
        @article = current_user.articles.create(title: params[:article][:title], content: params[:article][:content])
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
    end

    def update
        @article.update(title: params[:article][:title], content: params[:article][:content])
        
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
   
end
