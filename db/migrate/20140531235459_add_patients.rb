class AddPatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :kidzcan_number
      t.string :hospital_ref_number
      t.string :firstname
      t.string :lastname
      t.string :sex
      t.date   :date_of_birth
      t.date   :date_of_death
      t.date   :kidzcan_registration
      t.string :mobile_number
      t.string :status
      t.text   :point_of_contact
      t.text   :diagnosis

      t.timestamps
    end
  end
end
