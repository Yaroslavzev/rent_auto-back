# db/migrate/20181114172638_create_settlements.rb
class CreateSettlements < ActiveRecord::Migration[5.2]
  def change
    create_table :settlements, comment: 'Справочник населенных пунктов (город/деревня/село)' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :status, foreign_key: true
      t.references :district, foreign_key: true
      t.references :region, foreign_key: true
      t.references :country, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
