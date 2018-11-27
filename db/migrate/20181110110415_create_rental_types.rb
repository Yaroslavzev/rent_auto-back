# db/migrate/20181110110415_create_rental_types.rb
class CreateRentalTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :rental_types, comment: 'Справочник тарифных планов' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название тарифного плана (зима, лето, ...)'
      t.boolean :active, default: true, comment: 'актуальность'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
