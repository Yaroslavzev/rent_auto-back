# db/migrate/20181110114931_create_day_ranges.rb
class CreateDayRanges < ActiveRecord::Migration[5.2]
  def change
    create_table :day_ranges, comment: 'Справочник диапазонов дней аренды' do |t|
      t.string :code
      t.string :name
      t.integer :day_from
      t.integer :day_to
      t.text :note

      t.timestamps
    end
  end
end
