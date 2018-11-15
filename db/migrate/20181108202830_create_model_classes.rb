# 20181108202830_create_model_classes.rb
class CreateModelClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :model_classes, comment: 'Справочник классов моделей автомобилей' do |t|
      t.string :code
      t.string :name
      t.text :note

      t.timestamps
    end
  end
end
