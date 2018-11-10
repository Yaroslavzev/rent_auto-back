# db/migrate/20181108223557_create_trunks.rb
class CreateTrunks < ActiveRecord::Migration[5.2]
  def change
    create_table :trunks, comment: 'Справочник багажников' do |t|
      t.string :code
      t.string :name
      t.references :trunk_type, foreign_key: true
      t.references :model, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
