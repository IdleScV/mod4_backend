class RoomsController < ApplicationController


    def index 

        rooms = Room.all 
        render json: rooms
        
    end

    def create 
        # byebug
        user = User.find_or_create_by(firebase_id: params[:firebase_id], username: params[:username])
        room = Room.create(max_number: params[:maxPeople], status: "open", room_number: params[:randomRoomNumber])
        user_room = UserRoom.create(user: user, room: room, host: true)
        render json: ({user: user, room: room, user_room: user_room}).to_json()
        # render json: user.to_json()
    end


    def show
        # byebug
        room = Room.find_by(room_number: params[:id])
        host_user = room.user_rooms.where(:host => true)
        users = room.users
        
        render json: {room_status: room.status, user_list: users, host: host_user[0].user, maxNum: room.max_number }
    end

    def update
        # byebug
        room = Room.where(:room_number => params[:id]).last
        if room.users.length >= 1
            room.status = 'closed'
            room.save
            round = Round.create(room: room, status: "drawing")
            render json: {message: "Starting Game"}
        else
            render json: {error: "Not Enough Players"}
        end
    end
end

# def creatingdrawing #for a single user
#     room = Room.where(:room_number => params[:id]).last
#     round = room.rounds.last
#     Drawing.create(drawing: params[:drawingData], prompt_id: params[:prompt_id], user_id: params[:user_id], status: "finished")
#     if round.drawings.length == room.users.length
#         render json: round.drawings
#     else 
#         render json: {message: "Refresh again"}
#     end
# end
