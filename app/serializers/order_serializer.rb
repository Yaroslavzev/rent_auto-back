# app/serializers/order_serializer.rb
class OrderSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :status, :date_from, :time_from, :date_to, :time_to, :days_count, :days_over, :weekend_fee, :workweek_fee, :days_fee, :addons_fee, :forfeit_fee, :discouts, :total_fee, :total_paid, :paid_full, :note

  has_one :vehicle
  has_one :model
  has_one :client
  has_one :issue_spot, class_name: 'Spot'
  has_one :return_spot, class_name: 'Spot'
  has_one :rental_plan
  has_one :pay_type

  has_many :order_addons
end
