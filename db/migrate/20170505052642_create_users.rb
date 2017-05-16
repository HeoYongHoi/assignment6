class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :password_digest
      t.string :Name
      t.string :Gender
      t.integer :Birth_Date
      
      t.timestamps null: false
    end
  end
end
