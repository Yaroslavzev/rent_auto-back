if Object.const_defined?('NewGoogleRecaptcha')
  NewGoogleRecaptcha.setup do |config|
    config.site_key   = ENV['SITE_KEY']"6LcOPX4UAAAAAMKNr7yUMt2I8vX6YY9FGggIhwHD"
    config.secret_key = ENV['SECRET_KEY']"6LcOPX4UAAAAABpby-VvmyIFwh_YyKr6PJP0tKdN"
  end
end
