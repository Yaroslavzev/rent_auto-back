# app/serializers/day_range_serializer.rb
class DayRangeSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :day_from, :day_to, :note
end
