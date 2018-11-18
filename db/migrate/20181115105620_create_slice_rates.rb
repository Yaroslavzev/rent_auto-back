# db/migrate/20181115105620_create_slice_rates.rb
class CreateSliceRates < ActiveRecord::Migration[5.2]
  def change
    create_table :slice_rates, comment: 'Справочник коэффициентов по срезам дней' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название среза дней'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :rental_rate, foreign_key: true, comment: 'тариф коэффициентов'
      t.references :days_slice, foreign_key: true, comment: 'срез дней'
      t.float :rate, comment: 'коэффициент'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
