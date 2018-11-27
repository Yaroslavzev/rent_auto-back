# app/models/model.rb
class Model < ApplicationRecord
  belongs_to :model_class
  belongs_to :brand
  belongs_to :manufacture
  belongs_to :body_type

  has_many :rentals, dependent: :destroy
  has_many :formats, -> { select 'formats.*' }, as: :formatable, primary_key: :table_name

  # has_many_attached :images
end
