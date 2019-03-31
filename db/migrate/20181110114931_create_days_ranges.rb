# db/migrate/20181110114931_create_days_ranges.rb
class CreateDaysRanges < ActiveRecord::Migration[5.2]
  def change
    create_table :days_ranges, comment: 'Справочник диапазонов дней аренды' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название диапазона дней'
      t.boolean :active, default: true, comment: 'актуальность'
      t.integer :days_from, comment: 'начало диапазона дней'
      t.integer :days_to, comment: 'конец диапазона дней'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
