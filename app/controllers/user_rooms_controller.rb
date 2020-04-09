class UserRoomsController < ApplicationController


    def index 

        user_rooms = UserRoom.all
        render json: user_rooms.to_json()

    end

    def create 
        room = Room.find_by(room_number: params[:roomNum])
        
        if room
            if room.status == "open"
            # Create or find user
            user = User.find_or_create_by(firebase_id: params[:firebase_id], username: params[:username])
            # Create useroom instance
            userroom = UserRoom.create(user: user, room: room, host: false)
            # finding all users in room
            userrooms = UserRoom.where(:room_id => room.id)
            users = userrooms.map{ |i| i.user }
            # return all users
            render json: {users: users, roomnum: params[:roomNum] }
            else
            render json: {message: "Room no longer open"}
            end
        else
            render json: {message: "Room doesn't exist"}
        end
    end
end
