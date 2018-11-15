# app/models/user.rb
class User < ApplicationRecord
  belongs_to :client
end
