# db/migrate/20181114172638_create_settlements.rb
class CreateSettlements < ActiveRecord::Migration[5.2]
  def change
    create_table :settlements, comment: 'Справочник населенных пунктов (город/деревня/село)' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название нас.пункта'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :status, foreign_key: true, comment: 'статус нас.пункта'
      t.references :district, foreign_key: true, comment: 'административный район (необязательное поле)'
      t.references :region, foreign_key: true, comment: 'регион (необязательное поле)'
      t.references :country, foreign_key: true, comment: 'страна'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
