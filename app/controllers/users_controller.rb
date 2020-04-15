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
            drawings = user.drawings
            reviews = drawings.map{|d| d.reviews}
            prompt = drawings.map{|d| d.prompt_datum}
            render json: {username: user.username, drawings: drawingss,  reviews: reviews, prompt: prompt}
        else 
            render json: {message: "user has not played any games"}
        end

    end


end
