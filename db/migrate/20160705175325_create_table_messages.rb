class CreateTableMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :user
      t.text :body
      t.string :email

      t.timestamps null: false
    end
    add_index :messages, :user
  end
end
