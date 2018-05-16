class ChangeAddressToStreet < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :address, :street
  end
end
