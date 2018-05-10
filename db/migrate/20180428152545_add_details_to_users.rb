class AddDetailsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :zip, :integer
    add_column :users, :state, :string
  end
end