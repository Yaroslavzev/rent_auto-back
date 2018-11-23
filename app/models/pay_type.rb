# app/models/pay_type.rb
class PayType < ApplicationRecord
  has_many :orders, dependent: :nullify
end
