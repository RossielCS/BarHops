class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :user
      t.string :name

      t.timestamps
    end
    add_index :groups, :name,                unique: true
  end
end
