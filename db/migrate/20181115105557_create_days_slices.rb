# db/migrate/20181115105557_create_days_slices.rb
class CreateDaysSlices < ActiveRecord::Migration[5.2]
  def change
    create_table :days_slices, comment: 'Справочник срезов дней (выходные, будние, праздники)' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название среза дней'
      t.boolean :active, default: true, comment: 'актуальность'
      t.boolean :week, comment: 'дни недели если true, иначе дни месяца'
      t.integer :mon_from, comment: 'начальный месяц (nil для дней недели)'
      t.integer :day_from, comment: 'начальный день недели/месяца'
      t.time :time_from, comment: 'начальное время'
      t.integer :mon_to, comment: 'начальный месяц (nil для дней недели)'
      t.integer :day_to, comment: 'конечный день недели/месяца'
      t.time :time_to, comment: 'конечное время'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
