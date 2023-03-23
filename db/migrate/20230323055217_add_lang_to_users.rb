class AddLangToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :language, :string, limit: 255
  end
end
