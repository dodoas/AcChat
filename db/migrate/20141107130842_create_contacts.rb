class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_addres
      t.string :phone
      t.string :address
      t.string :web_site

      t.timestamps
    end
  end
end
