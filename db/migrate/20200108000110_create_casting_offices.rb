class CreateCastingOffices < ActiveRecord::Migration[6.0]
  def change
    create_table :casting_offices do |t|
      t.string :name
      t.string :email
      t.string :office_number
      t.string :location
      t.text :notes

      t.timestamps
    end
  end
end
