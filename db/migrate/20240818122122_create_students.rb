class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :subject
      t.integer :marks

      t.timestamps
    end

    add_index :students, [:name, :subject], unique: true
  end
end
