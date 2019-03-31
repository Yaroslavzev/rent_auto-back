# app/serializers/country_serializer.rb
class CountrySerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :note
end
