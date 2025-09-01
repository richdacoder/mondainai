class AddPreferredLanguageToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :preferred_language, :string, default: "english"
  end
end
