# app/serializers/days_slice_serializer.rb
class DaysSliceSerializer < ActiveModel::Serializer
  attributes :id, :code, :name, :active, :week, :mon_from, :day_from, :time_from, :mon_to, :day_to, :time_to, :note

  attribute :time_from do object.time_from.to_s end
  attribute :time_to do object.time_to.to_s end
end
