class Round < ApplicationRecord
  belongs_to :room
  has_many :drawings
  has_many :reviews, through: :drawings
  
end
