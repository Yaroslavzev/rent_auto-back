# db/migrate/20181114172204_create_regions.rb
class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions, comment: 'Справочник регионов (республика/край/область/округ)' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название региона'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :country, foreign_key: true, comment: 'страна'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
