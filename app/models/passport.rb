# app/models/passport.rb
class Passport < ApplicationRecord
  belongs_to :country
  belongs_to :address

  has_one :client, dependent: :restrict_with_exception
end
