# app/models/trunk_type.rb
class TrunkType < ApplicationRecord
  has_many :trunks, dependent: :nullify
end
