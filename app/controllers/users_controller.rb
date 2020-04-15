class UsersController < ApplicationController


    def index
        users = User.all
        render json: users.to_json()

    end

    def create
        
    end

    def show

       
        user = User.find_by(firebase_id: params[:id])

        if user
            
            drawings = user.drawings
            reviews = drawings.map{|d| d.reviews}
            prompt = drawings.map{|d| d.prompt_datum}
            render json: {username: user.username, drawings: drawings,  reviews: reviews, prompt: prompt}
        else 
            render json: {message: "user has not played any games"}
        end

    end


end
