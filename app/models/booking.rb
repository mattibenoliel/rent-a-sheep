class Booking < ApplicationRecord
  belongs_to :sheep
  belongs_to :user
end
