# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :vehicle
  belongs_to :model
  belongs_to :client
  belongs_to :issue_spot, class_name: 'Spot'
  belongs_to :return_spot, class_name: 'Spot'
  belongs_to :rental_plan
  belongs_to :pay_type

  has_many :order_addons, dependent: :destroy

  # attribute :time_from, :time
  # attribute :time_to, :time

  # serialize :time_from, Tod::TimeOfDay
  # serialize :time_to, Tod::TimeOfDay
end
