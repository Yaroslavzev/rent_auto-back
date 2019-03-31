# app/models/authentication_token.rb
class AuthenticationToken < ApplicationRecord
  belongs_to :user
end
