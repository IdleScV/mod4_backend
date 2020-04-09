class User < ApplicationRecord
    has_many :reviews
    has_many :drawings
    has_many :user_rooms
    has_many :rooms, through: :user_rooms
end
