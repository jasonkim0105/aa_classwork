class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: true
      t.string :password_digest, null: true
      t.string :session_token, null: false
      t.timestamps
    end
  end
end
