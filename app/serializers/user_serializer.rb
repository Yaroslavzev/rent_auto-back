# app/serializers/user_serializer.rb
class UserSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :verified, :secret, :role, :email, :image, :note
  has_one :client
end
