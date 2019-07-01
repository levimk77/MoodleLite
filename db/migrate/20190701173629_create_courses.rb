class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.string :teacher
      t.string :department
      t.integer :admin_id

      t.timestamps
    end
  end
end
