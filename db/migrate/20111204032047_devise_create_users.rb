class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string    :username
      t.string    :name
      t.string    :phone
      t.datetime  :birthdate
      t.string    :gender
      t.string    :position
      t.text      :bio
      t.boolean   :is_admin,      :default => false
      
      t.integer   :events_count,  :default => 0
      t.integer   :reports_count, :default => 0
      t.integer   :posts_count,   :default => 0
      
      t.database_authenticatable  :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.encryptable
      t.confirmable
      t.token_authenticatable

      t.timestamps
    end

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :authentication_token, :unique => true
    add_index :users, :username,             :unique => true
    add_index :users, :is_admin
  end

end
