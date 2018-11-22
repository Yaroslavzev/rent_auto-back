# app/models/status.rb
class Status < ApplicationRecord
  has_many :settlements, dependent: :nullify
end
