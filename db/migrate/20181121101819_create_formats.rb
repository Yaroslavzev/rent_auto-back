# db/migrate/20181121101819_create_formats.rb
class CreateFormats < ActiveRecord::Migration[5.2]
  def change
    create_table :formats, comment: 'Справочник шаблонов вывода' do |t|
      t.references :formatable, polymorphic: true, optional: true, comment: 'связанная таблица'
      t.string :key, comment: 'ключ шаблона (поле)'
      t.string :format, comment: 'строка шаблона'
      t.string :args, comment: 'аругменты для шаблона'

      t.timestamps
    end
  end
end
