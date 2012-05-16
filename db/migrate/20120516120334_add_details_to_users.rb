class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :image, :string
    add_column :users, :birthday, :date
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :description, :text
  end
end
