# app/serializers/format_serializer.rb
class FormatSerializer < ActiveModel::Serializer
  attributes :id, :formatable_type, :key, :format, :args
end
