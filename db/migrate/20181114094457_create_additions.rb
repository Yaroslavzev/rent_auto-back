# db/migrate/20181114094457_create_additions.rb
class CreateAdditions < ActiveRecord::Migration[5.2]
  def change
    create_table :additions, comment: 'Справочник дополнений (услуг и снаряжения)' do |t|
      t.string :code
      t.string :name
      t.boolean :active, default:true
      t.boolean :service, default:true
      t.decimal :price, default:0
      t.text :note

      t.timestamps
    end
  end
end
