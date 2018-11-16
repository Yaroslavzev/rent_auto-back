# db/migrate/20181108202445_create_manufactures.rb
class CreateManufactures < ActiveRecord::Migration[5.2]
  def change
    create_table :manufactures, comment: 'Справочник производителей автомобилей' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :brand, foreign_key: true
      t.references :country, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
