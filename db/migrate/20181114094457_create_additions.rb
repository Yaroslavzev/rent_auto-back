# db/migrate/20181114094457_create_additions.rb
class CreateAdditions < ActiveRecord::Migration[5.2]
  def change
    create_table :additions, comment: 'Справочник дополнений (услуг и снаряжения)' do |t|
      t.string :code, default: nil, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, default: nil, comment: 'название услуги/снаряжения'
      t.boolean :active, default:true, comment: 'актуальность'
      t.boolean :service, default:true, comment: 'отметка услуги'
      t.decimal :price, default:0, comment: 'цена'
      t.text :note, default: nil, comment: 'заметки'

      t.timestamps
    end
  end
end
