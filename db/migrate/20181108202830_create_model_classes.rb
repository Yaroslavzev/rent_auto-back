# 20181108202830_create_model_classes.rb
class CreateModelClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :model_classes, comment: 'Справочник классов моделей автомобилей' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название класса модели'
      t.boolean :active, default: true, comment: 'актуальность'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
