class Drawing < ApplicationRecord
  belongs_to :round
  belongs_to :user
  has_many :reviews
end
