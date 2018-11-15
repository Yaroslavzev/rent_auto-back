# db/migrate/20181108202103_create_brands.rb
class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands, comment: 'Справочник марок автомобилей' do |t|
      t.string :code
      t.string :name
      t.text :note

      t.timestamps
    end
  end
end
