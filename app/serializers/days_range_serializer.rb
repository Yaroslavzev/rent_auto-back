# app/serializers/days_range_serializer.rb
class DaysRangeSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :days_from, :days_to, :note
end
