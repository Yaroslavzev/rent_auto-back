# Загрузить конфигурацию БД обмена Pysoft
PYSOFT_DB = YAML.load(ERB.new(File.read(Rails.root.join("config","database_pysoft.yml"))).result)[Rails.env]
