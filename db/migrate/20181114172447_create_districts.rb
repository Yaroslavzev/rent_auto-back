# db/migrate/20181114172447_create_districts.rb
class CreateDistricts < ActiveRecord::Migration[5.2]
  def change
    create_table :districts, comment: 'Справочник административных районов' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :region, foreign_key: true
      t.references :country, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
