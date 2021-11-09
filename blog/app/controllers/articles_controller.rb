class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def new 
        @article = Article.new #envia un articulo nuevo al formlario de la vista
    end

    def create
        @article = Article.create(title: params[:article][:title], content: params[:article][:content])
        render json: @article
    end

    def edit
        @article = Article.find(params[:id])
        puts "\n\n\n  #{@article.persisted?} \n\n\n"
    end

    def update
        @article = Article.find(params[:id])
        @article.update(title: params[:article][:title], content: params[:article][:content])
        
        redirect_to @article
    end

    
    
end
