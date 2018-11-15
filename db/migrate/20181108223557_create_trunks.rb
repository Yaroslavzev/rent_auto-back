# db/migrate/20181108223557_create_trunks.rb
class CreateTrunks < ActiveRecord::Migration[5.2]
  def change
    create_table :trunks, comment: 'Справочник багажников автомобилей' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :model, foreign_key: true
      t.references :trunk_type, foreign_key: true
      t.decimal :price
      t.text :note

      t.timestamps
    end
  end
end
