# db/migrate/20181114094457_create_additions.rb
class CreateAdditions < ActiveRecord::Migration[5.2]
  def change
    create_table :additions, comment: 'Справочник дополнений (услуг и снаряжения)' do |t|
      t.string :code, default: nil
      t.string :name, default: nil
      t.boolean :active, default:true
      t.boolean :service, default:true
      t.decimal :price, default:0
      t.text :note, default: nil

      t.timestamps
    end
  end
end
