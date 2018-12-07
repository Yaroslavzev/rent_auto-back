# app/serializers/info_model_serializer.rb
class InfoModelSerializer < ActiveModel::Serializer
  include FormatableSerializer

  attributes :id, :code, :name, :style,
              :engine_volume, :link, :note, :range_rates, :slice_rates, :rental

  has_one :model_class
  has_one :brand

end
