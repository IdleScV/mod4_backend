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
        render json: {room_status: room.status, user_list: users, host: host_user[0].user }

    end

end