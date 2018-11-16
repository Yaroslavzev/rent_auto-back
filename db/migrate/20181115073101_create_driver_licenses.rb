# db/migrate/20181115073101_create_driver_licenses.rb
class CreateDriverLicenses < ActiveRecord::Migration[5.2]
  def change
    create_table :driver_licenses, comment: 'Справчник водительских прав' do |t|
      t.string :code, default: nil
      t.string :name, default: nil
      t.boolean :active, default: true
      t.boolean :verified, default: false
      t.references :country, foreign_key: true
      t.string :serial
      t.string :number
      t.string :category
      t.string :issued_by
      t.string :issued_code
      t.date :issued_date
      t.date :valid_to
      t.text :note, default: nil

      t.timestamps
    end
  end
end
