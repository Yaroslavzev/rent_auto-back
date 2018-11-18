# db/migrate/20181114172845_create_addresses.rb
class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses, comment: 'Справочник адресов' do |t|
      t.string :code, default: nil, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, default: nil, comment: 'полное название (необязательное поле)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.boolean :verified, default: false, comment: 'прошле ли проверку'
      t.references :country, foreign_key: true, comment: 'страна регистрации'
      t.references :region, foreign_key: true, comment: 'регион регистрации (необязательное поле)'
      t.references :district, foreign_key: true, comment: 'район регистрации (необязательное поле)'
      t.references :settlement, foreign_key: true, comment: 'нас.пункт регистрации'
      t.string :postcode, comment: 'почтовый инедекс (нужен, не?:))'
      t.string :street, comment: 'улица'
      t.string :house, comment: 'дом'
      t.string :flat, comment: 'квартира'
      t.string :address1, default: nil, comment: 'международного формат (необязательное поле)'
      t.string :address2, default: nil, comment: 'международного формат (необязательное поле)'
      t.text :note, default: nil, comment: 'заметки'

      t.timestamps
    end
  end
end
