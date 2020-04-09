class UsersController < ApplicationController


    def index
        users = User.all
        render json: users.to_json()

    end

    def create
        
    end

    def show

        user = User.find(params[:id])
        render json: user.to_json()

    end

    
    private

    def user_params
        params.require(:user).permit(:firebase_id, :usernam)
    end

end
