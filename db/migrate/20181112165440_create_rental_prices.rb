# db/migrate/20181112165440_create_rental_prices.rb
class CreateRentalPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_prices, comment: 'Справчник базовых цен для моделей (классов?)' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название базовых цен'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :model, foreign_key: true, comment: 'модель'
      t.references :model_class, foreign_key: true, comment: 'класс модели'
      t.decimal :hour, comment: 'стоимость часа'
      t.decimal :day, comment: 'стоимость дня'
      t.decimal :forfeit, comment: 'штраф (за просроченный день?)'
      t.decimal :earnest, comment: 'залог'
      t.decimal :km, comment: 'стоимость километра'
      t.decimal :km_over, comment: 'лимит километров(?)'
      t.decimal :weekend
      t.decimal :workweek
      t.decimal :workday
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
