class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password #no unencrypted pw

      t.timestamps #created_at, updated_at
    end
  end
end
