class AddTranslatedContentToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :translated_content, :text
  end
end
