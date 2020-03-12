class Sheep < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
   pg_search_scope :global_search,
     against: [],
     associated_against: {
      user: [ :address ]
      },
     using: {
       tsearch: { prefix: true } # <-- now `superman batm` will return something!
     }
end
