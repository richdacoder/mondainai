class ChangeWeightToFloat < ActiveRecord::Migration[7.1]
  def change
    change_column :items, :weight, :float
  end
end
