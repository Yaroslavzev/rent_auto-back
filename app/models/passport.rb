# app/models/passport.rb
class Passport < ApplicationRecord
  belongs_to :country
  belongs_to :address
end
