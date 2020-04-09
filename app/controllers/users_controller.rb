class UsersController < ApplicationController


    def index
        users = User.all
        render json: users.to_json()
    end

    def create
        debugger
    end

    

end
