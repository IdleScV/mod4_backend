class ReviewsController < ApplicationController



    def index 
        reviews = Review.all
        render json: reviews 

    end 

    def create
        user = User.find_by(firebase_id: params[:firebaseId])
        drawing = Drawing.find(params[:drawingId])
        rating = nil
        if params[:like] == "downvote"
            rating = false
        else 
            rating = true
        end
        review = Review.create(user: user, drawing: drawing, comment: params[:comment], like: rating)
        render json: review
    end 



    def refresh
        
        room = Room.find_by(:room_number => params[:roomNumber] )
        
        round = room.rounds.last
        drawings = round.drawings

        count = 0
  
        drawings.each{ |d| count += d.reviews.length}


        reviews = drawings.map{|d| d.reviews}
        prompt = drawings.map{|d| d.prompt_datum}
        creator = drawings.map{|d| d.user}

        if count == params[:reviews_needed]
            render json: {drawings: drawings, reviews: reviews, prompt: prompt, creator: creator}
        else
            render json: {message: "Waiting for all users to submit reviews"}
        end
       
        
        # reviews = Reviews.find_by(params[:reviews_needed])
    end


end
