# db/migrate/20181112165440_create_rental_prices.rb
class CreateRentalPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_prices, comment: 'Справчник базовых цен для моделей (классов?)' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :model, foreign_key: true
      t.references :model_class, foreign_key: true
      t.decimal :hour
      t.decimal :day
      t.decimal :forfeit
      t.decimal :earnest
      t.decimal :km
      t.decimal :km_over
      # t.decimal :weekend
      # t.decimal :workweek
      # t.decimal :workday
      t.text :note

      t.timestamps
    end
  end
end
