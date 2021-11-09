class ArticlesController < ApplicationController

    before_action :find_article, except: [:new, :create] #only:[:show,:edit,:update,:destroy]
    #after_action 

    def show
    ends

    def new 
        @article = Article.new #envia un articulo nuevo al formlario de la vista
    end

    def create
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        render json: @article
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
