class ChangePickupDateToDatetimeInRequests < ActiveRecord::Migration[7.1]
  def change
    change_column :requests, :pickup_date, :datetime
  end
end
