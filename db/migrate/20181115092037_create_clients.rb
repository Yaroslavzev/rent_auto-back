# db/migrate/20181115092037_create_clients.rb
class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients, comment: 'Справочник клиентов' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.date :birthday
      t.string :phone #, array: true
      t.references :address, foreign_key: true
      t.references :passport, foreign_key: true
      t.references :driver_license, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
