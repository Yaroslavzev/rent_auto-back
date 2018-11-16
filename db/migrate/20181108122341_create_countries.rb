# db/migrate/20181108122341_create_countries.rb
class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries, comment: 'Справочник стран' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.text :note

      t.timestamps
    end
  end
end
