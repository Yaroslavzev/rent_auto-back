# db/migrate/20181115101117_create_users.rb
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, comment: 'Справочник пользователей' do |t|
      t.string :code, default: nil, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, index: { unique: true }, null: false, default: '', comment: 'имя пользователя (nickname)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.boolean :verified, default: false, comment: 'прошел ли проверку'
      t.string :role, null: false, default: 'user', comment: 'роль пользователя в системе (admin, user и прочие)'
      t.string :email, index: { unique: true }, null: false, default: '', comment: 'электронная почта'
      t.string :encrypted_password, null: false, default: '', comment: 'зашифрованнный пароль'
      t.string :image, default: nil, comment: 'фотка/аватар/картинка профиля'
      t.references :client, foreign_key: true, comment: 'клиент (необязательно)'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
