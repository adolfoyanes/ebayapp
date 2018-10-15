class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :costs, :type, :category
  end
end
