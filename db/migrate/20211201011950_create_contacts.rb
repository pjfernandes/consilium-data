class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :message
      #t.string :ip
      #t.float :latitude
      #t.float :longitude
      #t.string :nickname

      t.timestamps
    end
  end
end
