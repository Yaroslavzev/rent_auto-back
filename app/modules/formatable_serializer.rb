# app/modules/formatable_serializer.rb
module FormatableSerializer
  # добавляет поля в сериалайзер из таблицы formats
  def attributes(*args)
    data = super
    object.formats.each do |fmt|
      data[fmt.key.to_sym] = (fmt.format % eval(fmt.args.gsub('$.', 'object.'))).strip
    end
    data
  end
end
