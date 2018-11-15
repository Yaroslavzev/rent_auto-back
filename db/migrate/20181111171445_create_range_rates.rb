# db/migrate/20181111171445_create_range_rates.rb
class CreateRangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :range_rates, comment: 'Связка коэффициентов и диапазонов дней' do |t|
      t.string :code
      t.string :name
      t.references :rental_rate, foreign_key: true
      t.references :day_range, foreign_key: true
      t.float :rate
      t.text :note

      t.timestamps
    end
  end
end
