class RemoveAdminIdFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :admin_id
  end
end
