# db/migrate/20181112170127_create_rental_plans.rb
class CreateRentalPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_plans, comment: 'Справочник тарифных планов' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :model, foreign_key: true
      t.references :model_class, foreign_key: true
      t.references :rental_type, foreign_key: true
      t.references :rental_rate, foreign_key: true
      t.references :rental_price, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
