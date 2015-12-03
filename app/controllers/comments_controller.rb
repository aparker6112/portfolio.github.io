class CommentsController < ApplicationController
	before_action :get_article
	def new

	end

	def create
		@comment = @article.comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "Successfully created comment"
			respond_to do |format|
				format.html { redirect_to article_path(@comment.article) }
				format.js
			end
		else
			flash[:danger] = "Failed to create comment"
			redirect_to article_path(@comment.article)
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:description)
	end

	def get_article
		@article = Article.find(params[:article_id])
	end
end