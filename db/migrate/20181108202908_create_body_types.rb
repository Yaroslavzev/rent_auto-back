# db/migrate/20181108202908_create_body_types.rb
class CreateBodyTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :body_types, comment: 'Справочник типов кузовов автомобилей' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.text :note

      t.timestamps
    end
  end
end
