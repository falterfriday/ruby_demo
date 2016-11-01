class UsersController < ApplicationController
    before_action :authorize, except: [:new, :create]
    before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

    def new
    end

    def show
        @users_secrets = Secret.where(user: @current_user)
        @liked_secrets = Secret.joins(:likes).where('likes.user_id' => @current_user.id)
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}"
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to '/'
        end
    end
    def edit
    end

    def update
        @user_id = params[:id]
        User.update(@user_id, user_params)
        redirect_to "/users/#{@user_id}"
    end
    
    def destroy
        user = User.find(params[:id])
        user.destroy
        redirect_to '/sessions/new'
        session[:user_id] = nil
    end

    private
    def user_params
        params.permit(:name, :email, :password, :password_confirmation)
    end
end
