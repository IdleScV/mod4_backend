class UserRoomsController < ApplicationController


    def index 

        user_rooms = UserRoom.all
        render json: user_rooms.to_json()

    end

    # Joining
    def create 
        room = Room.find_by(room_number: params[:roomNum])
        

        #We can use room.userrooms
        #We can iterate through each user by doing  room.user_rooms[0].user
        if room
            if room.status == "open"
                # Checks if user_room instance doesn't exist in the room
        

                if room.users.where(:firebase_id => params[:firebase_id]).length == 0
                    # Create or find user
                    user = User.find_or_create_by(firebase_id: params[:firebase_id], username: params[:username])
                    # Create useroom instance
                    userroom = UserRoom.create(user: user, room: room, host: false)
                    # finding all users in room
                    userrooms = UserRoom.where(:room_id => room.id)
                    users = userrooms.map{ |i| i.user }
                    # return all users
                    render json: {users: users, roomnum: params[:roomNum] }

                #user_room does exist in room
                else
                    # finding all users in room
                    userrooms = UserRoom.where(:room_id => room.id)
                    users = userrooms.map{ |i| i.user }
                    # return all users
                    render json: {users: users, roomnum: params[:roomNum] }
                end  
            else
            render json: {message: "Room no longer open"}
            end
        else
            render json: {message: "Room doesn't exist"}
        end
    end

    def destroy
        # Need
        # params[:roomNum] params[:firebase_id]
        
        room = Room.where(:room_number => params[:id])
        user = User.where(:firebase_id => params[:firebase_id])
        
        
        userroom = UserRoom.where(:user => user[0], :room => room[0])
      
        if userroom[0].host == true
            room[0].user_rooms.destroy_all
            room[0].delete
        else
            userroom[0].delete
        end
        
    end
end
