# db/migrate/20181115080941_create_spots.rb
class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots, comment: 'Справочник точек выдачи/возврата' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.references :address, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
