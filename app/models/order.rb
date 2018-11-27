# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :vehicle, optional: true
  belongs_to :model
  belongs_to :client
  belongs_to :issue_spot, class_name: 'Spot', optional: true
  belongs_to :return_spot, class_name: 'Spot', optional: true
  belongs_to :pay_type, optional: true
  belongs_to :rental_type, optional: true
  belongs_to :days_range, optional: true
  belongs_to :days_slice, optional: true

  has_many :order_addons, dependent: :destroy
end
