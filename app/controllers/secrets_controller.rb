class SecretsController < ApplicationController
    before_action :authorize

    def index
        @secrets = Secret.includes(:likes)
    end

    def create
        secret = Secret.new(content:params[:secret], user: @current_user)
        if secret.save
            redirect_to "/users/#{@current_user.id}"
        end
    end

    def destroy
        secret = Secret.find(params[:id])
        secret.destroy if secret.user == current_user
        redirect_to "/users/#{@current_user.id}"
    end
end
