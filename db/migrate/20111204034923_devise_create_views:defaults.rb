class DeviseCreateViews:defaults < ActiveRecord::Migration
  def change
    create_table(:views:defaults) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :views:defaults, :email,                :unique => true
    add_index :views:defaults, :reset_password_token, :unique => true
    # add_index :views:defaults, :confirmation_token,   :unique => true
    # add_index :views:defaults, :unlock_token,         :unique => true
    # add_index :views:defaults, :authentication_token, :unique => true
  end

end
