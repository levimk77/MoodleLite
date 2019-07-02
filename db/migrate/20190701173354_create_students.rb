class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :year
      t.string :major
      t.boolean :admin, :default => false

      t.timestamps
    end
  end
end
