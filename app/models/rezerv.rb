# Модель заявки (request) в БД обмена PSoft
class Rezerv < ActiveRecord::Base  
  establish_connection PSOFT_DB
  # Внешняя БД поддерживает хранение только 8 дополнений
  MAX_DOPS = 8
end
