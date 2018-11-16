# db/migrate/20181115101117_create_users.rb
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users, comment: 'Справочник пользователей' do |t|
      t.string :code, default: nil, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'имя пользователя (nickname)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.boolean :verified, default: false, comment: 'прошел ли проверку'
      t.string :secret, default: nil, comment: 'пароль'
      t.string :role, default: 'user', comment: 'статус пользователя в системе (admin, user и прочие)'
      t.string :email, comment: 'электронная почта'
      t.string :image, comment: 'фотка/аватар/картинка профиля'
      t.references :client, foreign_key: true, comment: 'клиент (необязательно)'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
