# db/migrate/20181115181035_create_order_addons.rb
class CreateOrderAddons < ActiveRecord::Migration[5.2]
  def change
    create_table :order_addons, comment: 'Справочник дополнений для каждого заказа' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название услуги/снаряжения (необязательное поле)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.references :order, foreign_key: true, comment: 'связанный заказ'
      t.references :addition, foreign_key: true, comment: 'услуга/снаряжения'
      t.decimal :price, default: nil, comment: 'цена (если nil, то берется из additions)'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
