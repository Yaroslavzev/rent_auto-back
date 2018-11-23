# app/models/model.rb
class Model < ApplicationRecord
  belongs_to :model_class
  belongs_to :brand
  belongs_to :manufacture
  belongs_to :body_type

  has_one :rental_price, dependent: :nullify
  has_many :formats, -> { select '"formats".*' }, as: :formatable, primary_key: :table_name
end
