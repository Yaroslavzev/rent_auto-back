# Загрузить конфигурацию БД обмена PSoft
db = Rails.application.config_for('database_psoft')
PSOFT_DB = db['database'] ? db : nil
