# db/migrate/20181114195149_create_passports.rb
class CreatePassports < ActiveRecord::Migration[5.2]
  def change
    create_table :passports, comment: 'Справочник паспортов' do |t|
      t.string :code, default: nil
      t.string :name, default: nil
      t.boolean :active, default: true
      t.boolean :verified, default: false, comment: 'прошел ли проверку'
      t.references :country, foreign_key: true, comment: 'страна выдачи'
      t.string :series, comment: 'серия паспорта'
      t.string :number, comment: 'номер паспорта'
      t.string :issued_by, comment: 'кем выдан'
      t.string :issued_code, comment: 'код подразделения'
      t.date :issued_date, comment: 'дата выдачи'
      t.date :valid_to, comment: 'дата окончания действия'
      t.references :address, foreign_key: true, comment: 'адрес регистрации'
      t.text :note, default: nil

      t.timestamps
    end
  end
end
