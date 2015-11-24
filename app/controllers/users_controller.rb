class UsersController < ApplicationController
	def signup
		@user = User.new
	end

	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "Successfully created account"
			redirect_to root_path
		else
			flash[:danger] = "Did not create account"
			render 'signup'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "Your account was updated Successfully"
			redirect_to root_path
		else
			render 'edit'
			flash[:danger] = "There was an error with your account!"
		end
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end
end