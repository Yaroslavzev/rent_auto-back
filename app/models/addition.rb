# app/models/addition.rb
class Addition < ApplicationRecord
  has_many :order_addons, dependent: :nullify
end
