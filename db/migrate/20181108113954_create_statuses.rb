# db/migrate/20181108113954_create_statuses.rb
class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses, comment: 'Справочник статусов нас.пунктов (город, село, деревня...)' do |t|
      t.string :code, comment: 'короткое название/аббревиатура/ключевое слово'
      t.string :name, comment: 'название статуса населенного пункта: город, село, деревня...'
      t.boolean :active, default: true, comment: 'актуальность'
      t.text :note, comment: 'заметки'

      t.timestamps
    end
  end
end
