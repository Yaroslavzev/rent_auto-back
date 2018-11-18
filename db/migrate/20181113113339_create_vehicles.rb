# db/migrate/20181113113339_create_vehicles.rb
class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles, comment: 'Справочник автомобилей' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название машины, примерно: <марка> <модель> <гос.номер>'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :model, foreign_key: true, comment: 'модель'
      t.string :garage_no, comment: 'гаражный номер'
      t.string :state_no, comment: 'гос. номер'
      t.string :vin, comment: 'идентификационный номер автомобиля'
      t.date :release, comment: 'дата выпуска'
      t.integer :mileage, comment: 'пробег'
      t.string :color, comment: 'цвет'
      t.string :specs, array: true, comment: 'стандартные характеристики (массив строк)'
      t.string :options, array: true, comment: 'прочее оснащение (массив строк)'
      t.references :trunk, foreign_key: true, comment: 'багажник'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
