class CreateBugs < ActiveRecord::Migration
  def change
    create_table :bugs do |t|
      t.string :name

      t.timestamps
    end
  end
end
