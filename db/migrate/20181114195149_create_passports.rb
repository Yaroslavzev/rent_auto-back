# db/migrate/20181114195149_create_passports.rb
class CreatePassports < ActiveRecord::Migration[5.2]
  def change
    create_table :passports, comment: 'Справочник паспортов' do |t|
      t.string :code, default: nil, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, default: nil, comment: 'полное название (необязательное поле)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.boolean :verified, default: false, comment: 'прошел ли проверку'
      t.references :country, foreign_key: true, comment: 'страна выдачи'
      t.string :series_number, comment: 'серия и номер паспорта'
      t.string :issued_by, comment: 'кем выдан'
      t.string :issued_code, comment: 'код подразделения'
      t.date :issued_date, comment: 'дата выдачи'
      t.date :valid_to, comment: 'дата окончания действия'
      t.references :address, foreign_key: true, comment: 'адрес регистрации'
      t.text :note, default: nil, comment: 'заметки'

      t.timestamps
    end
  end
end
