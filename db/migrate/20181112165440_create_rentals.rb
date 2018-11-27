# db/migrate/20181112165440_create_rental.rb
class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals, comment: 'Справчник тарифов для моделей автомобилей' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название тарифа'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :model, foreign_key: true, comment: 'модель'
      t.references :rental_type, foreign_key: true, comment: 'тарифный план'
      t.integer :km_limit, comment: 'лимит пробега'
      t.decimal :km_cost, comment: 'стоимость километра (сверх лимита?)'
      t.decimal :hour_cost, comment: 'стоимость часа'
      t.decimal :day_cost, comment: 'стоимость суток'
      t.decimal :forfeit, comment: 'штраф за просроченный день'
      t.decimal :earnest, comment: 'залог'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
