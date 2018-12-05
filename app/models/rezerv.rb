# Модель заявки (request) в БД обмена Pysoft
class Rezerv < ActiveRecord::Base  
  establish_connection PYSOFT_DB
end
