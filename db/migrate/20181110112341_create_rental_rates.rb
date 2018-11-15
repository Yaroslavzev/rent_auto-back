# db/migrate/20181110112341_create_rental_rates.rb
class CreateRentalRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_rates, comment: 'Справочник коэффициентов тарифов' do |t|
      t.string :code
      t.string :name
      t.references :model, foreign_key: true
      t.references :rental_type, foreign_key: true
      t.float :workweek
      t.float :weekend
      t.float :hour
      t.text :note

      t.timestamps
    end
  end
end
