class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :tutor
      t.string :language
      t.boolean :is_male
      t.string :teaching_regions
      t.string :currently
      t.boolean :online
      t.string :skype
      t.integer :rate
      t.string :nature

      t.timestamps
    end
  end
end
