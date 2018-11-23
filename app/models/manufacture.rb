# app/models/manufacture.rb
class Manufacture < ApplicationRecord
  belongs_to :brand
  belongs_to :country

  has_many :models, dependent: :nullify
end
