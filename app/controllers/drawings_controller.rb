class DrawingsController < ApplicationController



    def create 
        
        
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


