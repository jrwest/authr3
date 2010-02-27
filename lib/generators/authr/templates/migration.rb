class CreateAccountsTable < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :uname
      t.string :hashed_password
      #Any additional fields here

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
