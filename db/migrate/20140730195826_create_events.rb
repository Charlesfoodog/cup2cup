class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :address
      t.boolean :is_confirmed
      t.string :invitee_email

      t.timestamps
    end
  end
end
