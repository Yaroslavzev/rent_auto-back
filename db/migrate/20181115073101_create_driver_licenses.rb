# db/migrate/20181115073101_create_driver_licenses.rb
class CreateDriverLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :driver_licenses, comment: 'Справчник водительских удостоверений' do |t|
      t.string :code, default: nil
      t.string :name, default: nil
      t.boolean :active, default: true
      t.boolean :verified, default: false, comment: 'прошло ли проверку'
      t.references :country, foreign_key: true, comment: 'страна выдачи'
      t.string :series, comment: 'серия удостоверения'
      t.string :number, comment: 'номер удостоверения'
      t.string :category, comment: 'категория удостоверения'
      t.string :issued_by, comment: 'кем выдано'
      t.string :issued_code, comment: 'код подразделения (есть?)'
      t.date :issued_date, comment: 'дата выдачи'
      t.date :valid_to, comment: 'дата окончания действия'
      t.text :note, default: nil

      t.timestamps
    end
  end
end
