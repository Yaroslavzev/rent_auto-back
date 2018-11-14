# app/models/settlement.rb
class Settlement < ApplicationRecord
  belongs_to :status
  belongs_to :district
  belongs_to :region
  belongs_to :country
end
