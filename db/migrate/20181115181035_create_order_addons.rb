# db/migrate/20181115181035_create_order_addons.rb
class CreateOrderAddons < ActiveRecord::Migration[5.2]
  def change
    create_table :order_addons, comment: 'Справочник дополнений для каждого заказа' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :order, foreign_key: true
      t.references :addition, foreign_key: true
      t.decimal :price
      t.text :note

      t.timestamps
    end
  end
end
