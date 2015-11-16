class UserlistController < ApplicationController
	def index
		@users = User.all
	end

	def profile
		@users.find(params[:id])
	end

	private
end