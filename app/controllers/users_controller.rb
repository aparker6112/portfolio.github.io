class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]
	def signup
		@user = User.new
		redirect_to root_path if logged_in?
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
			UserMailer.signup_confirmation(@user).deliver
			session[:user_id] = @user.id
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

	def destroy
		@user = User.find(params[:id])
		session[:user_id] = nil
		@user.destroy
		flash[:danger] = "The user #{@user.username} has been destroyed!"
		redirect_to root_path
	end

	private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end

		def set_user
			@user = User.find(params[:id])
		end

		def require_same_user
			if current_user != @user
				flash[:danger] = "You do not have permission to do this!"
				redirect_to root_path
			end
		end
end