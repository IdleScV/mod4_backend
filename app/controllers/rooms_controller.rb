class RoomsController < ApplicationController


    def create 
        user = User.find_or_create_by(firebase_id: params[:firebase_id])
        room = Room.create(max_number: params[:maxPeople], status: "open", room_number: params[:randomRoomNumber])
        user_room = UserRoom.create(user: user, room: room, host: true)
        render json: ({user: user, room: room, user_room: user_room}).to_json()
        # render json: user.to_json()
    end


    
end