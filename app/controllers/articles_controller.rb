class ArticlesController < ApplicationController
require 'comment'
def new
	@article = Article.new
end

def create
	@article = Article.new(article_params)
	@article.user_id = current_user.id
	if @article.save 
			flash[:success] = "Post created successfully!"
			redirect_to article_path(@article)
	else
		flash[:danger] = "We could not create you're article!"
		render 'new'
	end
end

def show
	@article = Article.find(params[:id])
	@comment = Comment.new
end

private

	def article_params
		params.require(:article).permit(:title, :description)
	end

end