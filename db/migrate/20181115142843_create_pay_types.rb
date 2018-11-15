# db/migrate/20181115142843_create_pay_types.rb
class CreatePayTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :pay_types, comment: 'Справочник форм оплаты' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.float :tax, default: 0, comment: 'коэффициент налога'
      t.float :rebate, default: 0, comment: 'коэффициент льготы'
      t.float :discount, default: 0, comment: 'коэффициент скидки'
      t.text :note

      t.timestamps
    end
  end
end
