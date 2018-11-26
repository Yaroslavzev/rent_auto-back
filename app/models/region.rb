# app/models/region.rb
class Region < ApplicationRecord
  belongs_to :country

  has_many :districts, dependent: :nullify
  has_many :settlements, dependent: :nullify
  has_many :addresses, dependent: :nullify
end
