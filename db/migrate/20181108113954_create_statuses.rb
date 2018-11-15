# db/migrate/20181108113954_create_statuses.rb
class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses, comment: 'Справочник статусов нас.пунктов (город, село, деревня...)' do |t|
      t.string :code
      t.string :name
      t.text :note

      t.timestamps
    end
  end
end
