class ArticlesController < ApplicationController
require 'comment'

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

def show
  @user = User.find(params[:id])
	@article = Article.find(params[:id])
	@comment = Comment.new
end

private

	def article_params
		params.require(:article).permit(:title, :description)
	end

end