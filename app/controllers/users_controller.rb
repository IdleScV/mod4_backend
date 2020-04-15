class UsersController < ApplicationController


    def index
        users = User.all
        render json: users.to_json()

    end

    def create
        
    end

    def show

        user = User.find_by(params[:firebaseId])
        render json: user.drawings

    end


end
