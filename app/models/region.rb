# app/models/region.rb
class Region < ApplicationRecord
  belongs_to :country
end
