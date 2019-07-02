class AddBannedToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :banned, :boolean, :default => false
  end
end
