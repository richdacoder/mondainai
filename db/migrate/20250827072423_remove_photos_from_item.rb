class RemovePhotosFromItem < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :photo, :string
  end
end
