class RemoveBirthdayFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :birthday
  end

  def down
    add_column :users, :birthday, :date
  end
end
