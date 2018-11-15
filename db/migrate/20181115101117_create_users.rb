# db/migrate/20181115101117_create_users.rb
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, comment: 'Справочник пользователей' do |t|
      t.string :code, default: nil
      t.string :name
      t.boolean :active, default: true
      t.boolean :verified, default: false
      t.string :secret, default: nil
      t.string :role, default: 'user'
      t.string :email
      t.string :image
      t.references :client, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
