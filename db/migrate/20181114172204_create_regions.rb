# db/migrate/20181114172204_create_regions.rb
class CreateRegions < ActiveRecord::Migration[5.2]
  def change
    create_table :regions, comment: 'Справочник регионов (республика/край/область/округ)' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :country, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
