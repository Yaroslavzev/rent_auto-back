# app/models/district.rb
class District < ApplicationRecord
  belongs_to :region
  belongs_to :country

  has_many :settlements, dependent: :nullify
  has_many :addresses, dependent: :nullify
end
