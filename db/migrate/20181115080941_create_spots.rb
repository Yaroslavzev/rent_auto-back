# db/migrate/20181115080941_create_spots.rb
class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots, comment: 'Справочник точек выдачи/возврата' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название точки'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :address, foreign_key: true, comment: 'адрес точки'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
