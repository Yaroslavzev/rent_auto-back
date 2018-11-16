# db/migrate/20181112170127_create_rental_plans.rb
class CreateRentalPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_plans, comment: 'Справочник тарифных планов (сводная таблица)' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название тарифного плана, примерно: <марка> <модель> (<класс>)(<тип тарифа>)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :model, foreign_key: true, comment: 'модель'
      t.references :model_class, foreign_key: true, comment: 'класс модели'
      t.references :rental_type, foreign_key: true, comment: 'тип тарифа'
      t.references :rental_rate, foreign_key: true, comment: 'коэффициенты тарифа'
      t.references :rental_price, foreign_key: true, comment: 'цены тарифа'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
