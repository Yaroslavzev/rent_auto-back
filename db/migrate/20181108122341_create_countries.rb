# db/migrate/20181108122341_create_countries.rb
class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries, comment: 'Справочник стран' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово/код'
      t.string :name, comment: 'название страны'
      t.boolean :active, default: true, comment: 'актуальность'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
