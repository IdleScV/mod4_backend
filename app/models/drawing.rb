class Drawing < ApplicationRecord
  belongs_to :round
  belongs_to :user
  belongs_to :prompt_datum
  has_many :reviews
end
