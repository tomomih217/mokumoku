class AddDetailToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :hobby, :string, limit: 255
    add_column :users, :profile, :text, limit: 1000
  end
end
