# db/migrate/20181113113339_create_vehicles.rb
class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles, comment: 'Справочник автомобилей' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :model, foreign_key: true
      t.string :garage_no
      t.string :state_no
      t.string :vin
      t.date :release
      t.integer :mileage
      t.string :color
      t.string :specs, array: true
      t.string :options, array: true
      t.references :trunk, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
