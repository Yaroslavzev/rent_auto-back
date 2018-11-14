# db/migrate/20181114195149_create_passports.rb
class CreatePassports < ActiveRecord::Migration[5.2]
  def change
    create_table :passports, comment: 'Справочник паспортов' do |t|
      t.string :code, default: nil
      t.string :name, default: nil
      t.boolean :active, default: true
      t.boolean :checked, default: false
      t.references :country, foreign_key: true
      t.string :serial
      t.string :number
      t.string :issued_by
      t.string :issued_code
      t.date :issued_date
      t.date :valid_to
      t.references :address, foreign_key: true
      t.text :note, default: nil

      t.timestamps
    end
  end
end
