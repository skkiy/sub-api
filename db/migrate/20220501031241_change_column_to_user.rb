class ChangeColumnToUser < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :id, :string
  end

end
