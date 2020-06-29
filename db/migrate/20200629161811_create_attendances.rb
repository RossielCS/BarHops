class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :author_id
      t.references :group
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
