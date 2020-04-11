class DrawingsController < ApplicationController



    def create 
        
        #id's we need to create drawing
        user = User.find_by(firebase_id: params[:firebaseId])
        room = Room.where(:room_number => params[:room_number]).last
        round = room.rounds.last
        prompt = PromptDatum.find(params[:promptId])
        drawing = Drawing.create(round: round, user: user, prompt_datum: prompt, drawing: params[:drawingData], status: "finshed")
        if round.drawings.length == round.users.length
            render json: round.drawings
        else 
            render json: {message: "Refresh again"}
        end
        
    end

    # We need some kind of method that allows for all users to meet the condition
    # round.drawings.length == round.users.length

    def refresh
        room = Room.where(:room_number => params[:id]).last
        round = room.rounds.last
        if round.drawings.length == round.users.length 
            render json: round.drawings
        else 
            render json: {message: "Refresh again"}
        end
    end

end


# if round.drawings.length == room.users.length
    #         render json: round.drawings
    #     else 
    #         render json: {message: "Refresh again"}
    #     end