# Модель заявки (request) в БД обмена PSoft
class Rezerv < ActiveRecord::Base  
  establish_connection PSOFT_DB
end
