class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :content
      t.string :student_id
      t.string :post_id

      t.timestamps
    end
  end
end
