# db/migrate/20181114172447_create_districts.rb
class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts, comment: 'Справочник административных районов' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название района'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :region, foreign_key: true, comment: 'регион (необязательное поле)'
      t.references :country, foreign_key: true, comment: 'страна'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
