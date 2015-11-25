class CommentsController < ApplicationController

	def new

	end

	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "Successfully created comment"
			redirect_to article_path(@comment.article)
		else
			flash[:danger] = "Failed to create comment"
			redirect_to root_path
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:description)
	end
end