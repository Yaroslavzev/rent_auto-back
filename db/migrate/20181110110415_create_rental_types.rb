# db/migrate/20181110110415_create_rental_types.rb
class CreateRentalTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_types, comment: 'Справочник типов тарифных планов' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.text :note

      t.timestamps
    end
  end
end
