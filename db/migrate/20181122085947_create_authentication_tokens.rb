# db/migrate/20181122085947_create_authentication_tokens.rb
class CreateAuthenticationTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :authentication_tokens, comment: 'Справочник временных токенов' do |t|
      t.references :user, foreign_key: true
      t.string :body
      t.datetime :last_used_at
      t.integer :expires_in
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
    add_index :authentication_tokens, :body
  end
end
