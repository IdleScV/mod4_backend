class UsersController < ApplicationController


    def index
        users = User.all
        render json: users.to_json()

    end

    def create
        
    end

    def show

        user = User.find_by(params[:id])
        if user  
            render json: {drawings: user.drawings, username: user.username}
        else 
            render json: {message: "user has not played any games"}
        end

    end


end
