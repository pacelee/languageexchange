class AddEmailToProfile2 < ActiveRecord::Migration[5.0]
  def change
    change_table :profiles do |t|
      t.string :email
    end
  end
end
