# db/migrate/20181115165405_create_orders.rb
class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders, comment: 'Справочник заказов' do |t|
      t.string :code, default: nil, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, default: nil, comment: 'можно использовать для пометок (необязательное поле)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.string :status, default: 'created', comment: 'состояние заказа'
      t.references :vehicle, foreign_key: true, comment: 'конкретный автомобиль (может не быть)'
      t.references :model, foreign_key: true, comment: 'модель (если есть конкретный автомобиль то модель берем оттуда)'
      t.references :client, foreign_key: true, comment: 'клиент'
      t.references :issue_spot, foreign_key: { to_table: :spots }, comment: 'точка выдачи'
      t.references :return_spot, foreign_key: { to_table: :spots }, comment: 'точка возврата'
      t.date :date_from, comment: 'дата выдачи'
      t.time :time_from, comment: 'время выдачи'
      t.date :date_to, comment: 'дата возврата'
      t.time :time_to, comment: 'время возврата'
      t.integer :days_count, comment: 'кол-во дней аренды (наверно тех что не попали в другие тарифы)'
      t.integer :days_over, comment: 'кол-во просроченных дней'
      t.references :rental_plan, foreign_key: true, comment: 'тарифный план'
      t.references :pay_type, foreign_key: true, comment: 'форма оплаты'
      t.decimal :weekend_fee, comment: 'плата по тарифу выходных дней'
      t.decimal :workweek_fee, comment: 'плата по тарифу рабочей недели'
      t.decimal :days_fee, comment: 'плата по тарифу по дням'
      t.decimal :addons_fee, comment: 'плата за дополнительные услуги/снаряжение'
      t.decimal :forfeit_fee, comment: 'штрафы'
      t.decimal :discouts, comment: 'скидки'
      t.decimal :total_fee, comment: 'общая сумма к оплате'
      t.decimal :total_paid, comment: 'сколько уже оплачено от общей суммы (может быть частично/залог)'
      t.boolean :paid_full, default: false, comment: 'отметка о полной оплате'
      t.text :note, default: nil, comment: 'заметки'

      t.timestamps
    end

    # add_foreign_key :orders, :spots, column: :issue_spot_id, primary_key: :id
    # add_foreign_key :orders, :spots, column: :return_spot_id, primary_key: :id
  end
end
