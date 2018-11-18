# db/migrate/20181110112341_create_rental_rates.rb
class CreateRentalRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_rates, comment: 'Справочник коэффициентов тарифов' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название (для других справочников)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :model_class, foreign_key: true, comment: 'класс модели'
      t.references :rental_type, foreign_key: true, comment: 'тип тарифа'
      t.float :km, comment: 'коэффициент км'
      t.float :hour, comment: 'коэффициент часа'
      t.float :day, comment: 'коэффициент дня'
      # t.float :workweek
      # t.float :weekend
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
