# app/models/spot.rb
class Spot < ApplicationRecord
  belongs_to :address

  has_many :orders, dependent: :nullify
end
