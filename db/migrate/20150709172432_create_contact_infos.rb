class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :company
      t.string :facebook
      t.string :instagram
      t.string :github
      t.string :linkedin
      t.string :twitter
      t.string :site
      t.string :user_id

      t.timestamps null: false
    end
  end
end
