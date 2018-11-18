# db/migrate/20181108202445_create_manufactures.rb
class CreateManufactures < ActiveRecord::Migration[5.2]
  def change
    create_table :manufactures, comment: 'Справочник производителей автомобилей' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название производителя'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :brand, foreign_key: true, comment: 'марка'
      t.references :country, foreign_key: true, comment: 'страна производителя'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
