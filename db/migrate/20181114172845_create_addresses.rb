# db/migrate/20181114172845_create_addresses.rb
class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses, comment: 'Справочник адресов' do |t|
      t.string :code, default: nil
      t.string :name, default: nil
      t.boolean :active, default: true
      t.boolean :verified, default: false
      t.references :country, foreign_key: true
      t.references :region, foreign_key: true
      t.references :district, foreign_key: true
      t.references :settlement, foreign_key: true
      t.string :postcode
      t.string :street
      t.string :house
      t.string :flat
      t.string :address1, default: nil
      t.string :address2, default: nil
      t.text :note, default: nil

      t.timestamps
    end
  end
end
