class AddReferencesUserToImages < ActiveRecord::Migration[5.1]
  def change
  	remove_column :images, :user_id, index: true
  	add_reference :images, :user, foreign_key: true, index: true
  end
end
