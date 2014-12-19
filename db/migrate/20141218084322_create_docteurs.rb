class CreateDocteurs < ActiveRecord::Migration
  def change
    create_table :docteurs do |t|
      t.string :prenom
      t.string :nom
      t.string :adresse
      t.float :longitude
      t.float :latitude
      t.string :specialite
      t.timestamps
    end
  end
end
