# Загрузить конфигурацию БД обмена PSoft
PSOFT_DB = YAML.load(ERB.new(File.read(Rails.root.join("config","database_psoft.yml"))).result)[Rails.env]
