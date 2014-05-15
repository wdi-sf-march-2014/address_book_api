class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :photo
      t.integer :user_id
      t.timestamps
    end
  end
end
