class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :email
      t.string :image

      t.string :provider
      t.string :uid

      t.timestamps null: false
    end
  end
end