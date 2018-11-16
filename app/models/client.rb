class Client < ApplicationRecord
  belongs_to :address
  belongs_to :passport
  belongs_to :driver_license
end
