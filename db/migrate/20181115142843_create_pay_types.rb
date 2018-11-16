# db/migrate/20181115142843_create_pay_types.rb
class CreatePayTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pay_types, comment: 'Справочник форм оплаты' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название формы оплаты'
      t.boolean :active, default: true, comment: 'актуальность'
      t.float :tax, default: 0, comment: 'коэффициент налога (необязательно)'
      t.float :rebate, default: 0, comment: 'коэффициент льготы (необязательно)'
      t.float :discount, default: 0, comment: 'коэффициент скидки (необязательно)'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
