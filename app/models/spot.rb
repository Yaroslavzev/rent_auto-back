# app/models/spot.rb
class Spot < ApplicationRecord
  belongs_to :address

  has_many :order_issues, class_name: :Order, foreign_key: :issue_spot_id, dependent: :nullify
  has_many :order_returns, class_name: :Order, foreign_key: :return_spot_id, dependent: :nullify
end
