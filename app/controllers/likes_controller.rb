class LikesController < ApplicationController
    before_action :authorize

    def create
        like = Like.new(user: @current_user, secret: Secret.find(params[:secret_id]) )
        like.save
        redirect_to '/secrets'
    end

    def destroy
        like = Like.find(params[:like_id])
        like.destroy
        redirect_to '/secrets'
    end
end
