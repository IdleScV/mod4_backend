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





end
