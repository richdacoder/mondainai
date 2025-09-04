class AddAvailableTimesToModel < ActiveRecord::Migration[7.1]
  def change
    add_column :requests, :available_times, :string, array: true
  end
end
