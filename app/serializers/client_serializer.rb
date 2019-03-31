# app/serializers/client_serializer.rb
class ClientSerializer < ActiveModel::Serializer
  include FormatableSerializer

  attributes :id, :code, :name, :active, :verified, :first_name, :middle_name, :last_name, :gender, :birthday, :phone,
             :note

  has_one :address
  has_one :passport
  has_one :driver_license

  has_many :formats
end
