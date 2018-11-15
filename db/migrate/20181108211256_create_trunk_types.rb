# db/migrate/20181108211256_create_trunk_types.rb
class CreateTrunkTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :trunk_types, comment: 'Справочник типов багажников автомобилей' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.text :note

      t.timestamps
    end
  end
end
