class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients, comment: 'Справочник клиентов' do |t|
      t.string :code, default: nil, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'полное имя (необязательно)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.boolean :verified, default: false, comment: 'прошел ли проверку'
      t.string :first_name, comment: 'имя'
      t.string :middle_name, comment: 'отчество'
      t.string :last_name, comment: 'фамилия'
      t.string :gender, comment: 'пол'
      t.date :birthday, comment: 'дата рождения'
      t.string :phone, comment: 'телефонный номер'
      t.references :address, foreign_key: true, comment: 'адрес проживания (небязательно регистрации)'
      t.references :passport, foreign_key: true, comment: 'паспорт'
      t.references :driver_license, foreign_key: true, comment: 'вод.удостоверение'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
