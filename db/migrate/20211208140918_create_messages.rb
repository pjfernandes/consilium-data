class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :message
      t.string :ip
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
