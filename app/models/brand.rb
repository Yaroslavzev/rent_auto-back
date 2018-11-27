# app/models/brand.rb
class Brand < ApplicationRecord
  has_many :models, dependent: :nullify
  has_many :formats, -> { select 'formats.*' }, as: :formatable, primary_key: :table_name
end
