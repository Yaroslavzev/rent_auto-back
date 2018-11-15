# app/models/order_addon.rb
class OrderAddon < ApplicationRecord
  belongs_to :order
  belongs_to :addition
end
