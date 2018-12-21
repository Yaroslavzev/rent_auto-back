# db/migrate/20181111171445_create_range_rates.rb
class CreateRangeRates < ActiveRecord::Migration[5.2]
  def change
    create_table :range_rates, comment: 'Справочник коэффициентов по диапазонам дней' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название диапазона дней'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :model_class, foreign_key: true, comment: 'класс модели автомобиля'
      t.references :rental_type, foreign_key: true, comment: 'тарифный план'
      t.string :days_range#, foreign_key: true, comment: 'диапазон дней'
      t.float :rate, comment: 'коэффициент'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
