class ChangeProfileTable < ActiveRecord::Migration[5.0]
  def change
    change_table :profiles do |t|
      t.remove :currently
      t.rename :language, :teaching
      t.string :learning
    end
  end
end
