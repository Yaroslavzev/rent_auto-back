# app/models/country.rb
class Country < ApplicationRecord
  has_many :regions, dependent: :nullify
  has_many :districts, dependent: :nullify
  has_many :settlements, dependent: :nullify
  has_many :addresses, dependent: :nullify
  has_many :manufactures, dependent: :nullify
end
