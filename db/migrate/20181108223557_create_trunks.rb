# db/migrate/20181108223557_create_trunks.rb
class CreateTrunks < ActiveRecord::Migration[5.2]
  def change
    create_table :trunks, comment: 'Справочник багажников автомобилей' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название багажника'
      t.boolean :active, default: true, comment: 'актуальность'
      #t.references :model, foreign_key: true, comment: 'модель автомобиля'
      t.references :trunk_type, foreign_key: true, comment: 'тип банажника'
      t.decimal :price, default: nil, comment: 'цена (необязательна)'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
