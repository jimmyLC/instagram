  class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
    add_index :photos, :user_id
    add_index :photos, :comment_id
  end
end
