# app/models/trunk.rb
class Trunk < ApplicationRecord
  belongs_to :model
  belongs_to :trunk_type

  has_many :vehicles, dependent: :nullify

  attribute :price, :money
end
