# Загрузить конфигурацию БД обмена PSoft
db = YAML.load(ERB.new(File.read(Rails.root.join('config', 'database_psoft.yml'))).result)[Rails.env]
PSOFT_DB = db['database'] ? db : nil
