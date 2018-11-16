# db/migrate/20181108202908_create_body_types.rb
class CreateBodyTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :body_types, comment: 'Справочник типов кузовов автомобилей' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название типа кузова/автомобиля'
      t.boolean :active, default: true, comment: 'актуальность'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
