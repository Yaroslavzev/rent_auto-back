# app/models/format.rb
class Format < ApplicationRecord
  belongs_to :formatable, polymorphic: true, foreign_key: :formatable_type, optional: true
end
