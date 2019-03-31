# db/migrate/20181108211256_create_trunk_types.rb
class CreateTrunkTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :trunk_types, comment: 'Справочник типов багажников автомобилей' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название типа багажника'
      t.boolean :active, default: true, comment: 'актуальность'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
