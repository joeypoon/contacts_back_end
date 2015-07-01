class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :phone
      t.string :company
      t.string :city
      t.string :state
      t.string :facebook
      t.string :twitter
      t.string :linkedin
      t.string :github
      t.string :instagram

      t.timestamps null: false
    end
  end
end
