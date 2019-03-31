# db/migrate/20181108202103_create_brands.rb
class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands, comment: 'Справочник марок автомобилей' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название марки'
      t.boolean :active, default: true, comment: 'актуальность'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
