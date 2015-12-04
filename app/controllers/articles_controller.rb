class ArticlesController < ApplicationController
require 'comment'
before_action :set_article, only: [:edit, :update, :show, :destroy]
before_action :require_user, except: [:index, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]

def index
	@articles = Article.all
end

def new
	@article = Article.new
	redirect_to articles_path if !logged_in?
end

def create
	redirect_to articles_path if !logged_in?
	@articles = Article.all
	@article = Article.new(article_params)
	@article.user_id = current_user.id
	if @article.save 
			flash[:success] = "Post created successfully!"
			respond_to do |format|
				format.html { redirect_to articles_path }
				format.js
			end
	else
		flash[:danger] = "We could not create you're article!"
		render 'new'
	end
end

def edit
	@article = Article.find(params[:id])
end

def update
	@article = Article.find(params[:id])
		if @article.update(article_params)
			flash[:success] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end	
end

def show
	@article = Article.find(params[:id])
  @user = User.find(@article.user_id)
	@comment = Comment.new
end

def destroy 
	@article = Article.find(params[:id])
	@article.destroy
	flash[:danger] = "Article has been successfully deleted"
	redirect_to root_path
end

private

	def article_params
		params.require(:article).permit(:title, :description)
	end

	def set_article
		@article = Article.find(params[:id])
	end

	def require_same_user
		if current_user != @article.user
			flash[:danger] = "You do not have permission to perform this action!"
			redirect_to article_path(@article)
	end
end

end