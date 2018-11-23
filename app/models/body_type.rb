# app/models/body_type.rb
class BodyType < ApplicationRecord
  has_many :models, dependent: :nullify
end
