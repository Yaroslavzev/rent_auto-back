# db/migrate/20181108203836_create_models.rb
class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models, comment: 'Справочник моделей автомобилей' do |t|
      t.string :code
      t.string :name
      t.references :model_class 
      t.references :brand, foreign_key: true
      t.references :manufacture, foreign_key: true
      t.references :body_type, foreign_key: true
      t.boolean :active, default: true
      t.integer :door_count
      t.integer :seat_count
      t.string :style
      t.string :transmission
      t.string :drive_type
      t.string :fuel_type
      t.string :engine
      t.float :engine_volume
      t.string :specs, array: true
      t.string :options, array: true
      t.text :note

      t.timestamps
    end
  end
end
