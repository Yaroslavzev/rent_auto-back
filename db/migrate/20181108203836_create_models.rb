# db/migrate/20181108203836_create_models.rb
class CreateModels < ActiveRecord::Migration[5.2]
  def change
    create_table :models, comment: 'Справочник моделей автомобилей' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название модели'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :model_class, comment: 'класс модели'
      t.references :brand, foreign_key: true, comment: 'марка модели'
      t.references :manufacture, foreign_key: true, comment: 'производитель модели'
      t.references :body_type, foreign_key: true, comment: 'тип кузова'
      t.integer :door_count, comment: 'кол-во дверей'
      t.integer :seat_count, comment: 'кол-во посадочных мест'
      t.string :style, comment: 'стиль модели'
      t.string :transmission, comment: 'тип привода'
      t.string :drive_type, comment: 'коробка передач'
      t.string :fuel_type, comment: 'тип топлива'
      t.string :engine, comment: 'двигатель'
      t.float :engine_volume, comment: 'объем двигателя'
      t.string :specs, array: true, comment: 'стандартные характеристики (массив строк)'
      t.string :options, array: true, comment: 'прочее оснащение (массив строк)'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
