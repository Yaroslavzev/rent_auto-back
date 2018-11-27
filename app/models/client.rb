# app/models/client.rb
class Client < ApplicationRecord
  belongs_to :address
  belongs_to :passport
  belongs_to :driver_license

  has_one :user, dependent: :nullify

  has_many :orders, dependent: :restrict_with_exception

  has_many :formats, -> { select 'formats.*' }, as: :formatable, primary_key: :table_name
end
